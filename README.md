# Detetive Castelo Branco

Jogo de investigação feito em GameMaker (IDE 2024.13). O jogador controla o detetive Castelo Branco, conversa com NPCs, procura objetos escondidos e resolve puzzles com itens do inventário até descobrir quem matou Vinicius Carvalho.

## Controles

| Tecla | Ação |
|---|---|
| Setas | Andar (Shift corre) / navegar em listas |
| E | Interagir, avançar diálogo |
| I | Abrir/fechar inventário |
| Espaço/Enter | Marcar item (modo seleção) |
| C | Confirmar seleção de itens |
| 0–9, Backspace, Enter | Digitar senha |
| Esc | Cancelar seleção/senha, sair de minigame |

## Arquitetura

### Objetos globais (persistentes)

- **`obj_game_controller`**: inicializa todas as variáveis globais (estado e flags da história) e chama as funções de dados de `scr_game_data` e `scr_init_map_locations`. É a fonte única da inicialização: **toda flag nova deve ser declarada aqui**.
- **`obj_item_manager`**: guarda o inventário (`inv`) e desenha três telas:
  - inventário normal;
  - **modo seleção**, em que o jogador escolhe itens para resolver algo (`start_item_selection`);
  - **modo senha**, com teclado numérico (`start_password_entry`).

Os dois objetos se autodestroem se já existir uma instância, porque estão colocados em mais de uma room.

### Objetos pai

| Parent | Para quê | O filho define |
|---|---|---|
| `obj_interactable` | NPCs e objetos que respondem ao **E** quando o jogador está perto | `text_id` ou `on_interact`, e opcionalmente `interaction_distance` e `show_prompt` |
| `obj_hidden_object_trigger` (filho de `obj_interactable`) | Objeto que abre um minigame de objetos escondidos | `hidden_game_id` |
| `obj_block_parent` | Barreira invisível que empurra o jogador e mostra um aviso | `text_id`, `push_y`, `is_active()` |
| `obj_cutscene_parent` | Cutscene em sequência de ações | `cutscene`, `can_start()` |

Os filhos **sempre** chamam `event_inherited()` no começo do Create e não precisam de Step nem Draw próprios.

### Scripts

| Script | Conteúdo |
|---|---|
| `scr_game_data` | Tabelas de dados: itens (`scr_init_items`), retratos dos personagens (`scr_init_speakers`) e minigames de objetos escondidos (`scr_init_hidden_object_games`) |
| `scr_init_map_locations` | Locais do menu de mapa |
| `scr_game_text` | **Todos os diálogos**, indexados por id (`"event 12"`), com as opções de resposta |
| `scr_textbox_functions` | `create_textbox`, `scr_text`, `scr_option` |
| `scr_cutscene_functions` | Ações de cutscene (`cutscene_wait`, `cutscene_walk_*`, `cutscene_textbox`...) |
| `scr_interaction` | `player_is_free()` e `open_hidden_object_game()` |
| `add_item`, `remove_item`, `inventory_has_item` | Inventário, usando a chave do item em `global.item_list` |
| `scr_unlock_location`, `scr_go_to_map_menu`, `scr_transport_to_room` | Menu de mapa e troca de room |

### Estado do jogo

O progresso da história fica em flags `global.*` (ex.: `global.completed_crime_game`, `global.tomas_event_success`). Três regras mantêm isso organizado:

1. **Declare** toda flag nova no Create do `obj_game_controller`.
2. **Mude** flags no momento em que a coisa acontece: em `on_interact`, num callback de seleção ou numa fala de `scr_game_text`. Não crie Steps que fiquem checando flags a cada frame.
3. **Efeitos que o diálogo anuncia ficam no próprio diálogo.** Se a fala diz `"* Metro desbloqueado"` ou `"* Recebe foto secreta"`, a chamada de `scr_unlock_location`/`add_item` vai na linha logo abaixo, dentro de `scr_game_text`.

`player_is_free()` é falso durante diálogo (`global.dialogo`), cutscene (`global.on_cutscene`), inventário (`global.on_inventory`) e minigame (`global.in_hidden_object_game`). Ele bloqueia tanto o movimento quanto as interações.

## Como adicionar conteúdo

### Um diálogo

Em `scr_game_text`, adicione um `case` com um id novo:

```gml
case "event 80":
	scr_text("Fala sem retrato");
	scr_text("Fala com retrato", "castelo branco");
	scr_option("Resposta A", "event 80 - a"); // opções levam a outro id
	scr_option("Resposta B", "event 80 - b");
	break;
```

O segundo argumento de `scr_text` precisa ser um personagem registrado em `scr_init_speakers`. Se não for, aparece um aviso no console e a fala fica sem retrato.

### Um personagem (retrato)

Em `scr_init_speakers`:

```gml
_add("nome no dialogo", spr_retrato);     // retrato à direita (padrão)
_add("nome no dialogo", spr_retrato, 1);  // retrato à esquerda (protagonista)
```

### Um NPC

1. Crie o objeto com o sprite e defina **Parent = `obj_interactable`**.
2. No Create:

```gml
event_inherited();
text_id = "event 80";   // NPC simples: sempre a mesma fala
```

Para NPCs com falas que dependem do progresso, sobrescreva `on_interact`:

```gml
event_inherited();
on_interact = function() {
	if (!global.minha_flag) {
		global.minha_flag = true;
		create_textbox("event 80");
	} else {
		create_textbox("event 81");
	}
};
```

Se o NPC precisar bloquear a passagem, coloque um `obj_npc_wall` na room e defina `npc_obj = obj_meu_npc;` no creation code da instância.

### Um puzzle com itens do inventário

Dentro de `on_interact`:

```gml
obj_item_manager.start_item_selection(["clipe", "magnet"], 2, "Abra a caixa",
	function() { /* acertou */ create_textbox("event 49"); },
	function() { /* errou */   create_textbox("event 75"); }
);
```

A seleção só é correta se o jogador escolher **exatamente** os itens da lista. Para senha, use `obj_item_manager.start_password_entry("1337", "Coloque a senha:", sucesso, falha)`.

### Um item

Em `scr_init_items`, adicione uma entrada; a chave é o que se usa em `add_item`:

```gml
lupa : new Item("Lupa", "Descrição do item.", spr_lupa),
```

### Um minigame de objetos escondidos

1. Em `scr_init_hidden_object_games`:

```gml
escritorio_game : {
	background: spr_escritorio_base,
	completed_flag: "completed_escritorio_game", // declare essa flag no obj_game_controller
	completion_text: "event 82",
	objects: [
		// x/y relativos ao fundo; is_item: true adiciona ao inventário (key = chave do item)
		{ key: "lupa", sprite: spr_lupa, x: 120, y: 300, is_item: true },
	],
},
```

2. Crie um objeto com **Parent = `obj_hidden_object_trigger`** e, no Create:

```gml
event_inherited();
hidden_game_id = "escritorio_game";
```

### Um local no mapa

Em `scr_init_map_locations`, adicione uma linha. O último argumento diz se o local já começa liberado:

```gml
map_location(rm_nova_room, "Nome no Mapa", spawn_x, spawn_y),
```

Para liberar o local depois, chame `scr_unlock_location(rm_nova_room)`, de preferência na fala que anuncia o desbloqueio.

### Uma cutscene

Crie um objeto com **Parent = `obj_cutscene_parent`**:

```gml
event_inherited();
cutscene = [
	[cutscene_wait, 1],                          // segundos
	[cutscene_walk_up, 1, obj_npc_fraga, 4],     // segundos, objeto, pixels por frame
	[cutscene_play_sound, snd_reveal],
	[cutscene_textbox, "event 83"],
];
can_start = function() {
	return global.minha_flag;
};
```

Depois, crie a instância no Create do NPC ou da room: `instance_create_depth(0, 0, 0, obj_minha_cutscene);`.

- A cutscene pausa enquanto houver diálogo aberto e se destrói ao terminar.
- Para uma ação nova, crie uma função em `scr_cutscene_functions`. Ela deve chamar `action_end()` quando terminar, ou `cutscene_tick(segundos)` se durar vários frames.

## Pendências conhecidas

- **Final do jogo**: os eventos 62–70 (acusação e revelação) e o 59 estão escritos, mas ainda não são chamados por nenhum objeto. O `event 69` não tem `break` e continua direto no `event 70`.
- **Objetos fora das rooms**: `obj_locker` (cafeteria) e `obj_notebook` (casa do Castelo) existem, mas ainda não foram colocados em nenhuma room.
- **Ordem das rooms**: `rm_init` é uma room de testes e está em primeiro lugar. Para jogar pelo começo, coloque `rm_menu_2` primeiro.
- **Objetos duplicados**: `obj_npc_belo_1` e `obj_npc_gabriel_2` são iguais.
- **Nome com erro de digitação**: `opj_npc_belo` deveria ser `obj_npc_belo`. Renomear exige ajustar as rooms.
