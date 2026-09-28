// Base de tudo que o jogador pode examinar/conversar apertando E perto (NPCs, objetos).
// Filhos: chamar event_inherited() no Create e sobrescrever as variáveis/métodos abaixo.
text_id = "";               // diálogo padrão de on_interact
interaction_distance = 16;
show_prompt = false;        // desenha "Press E to examine" quando o jogador está perto
can_interact = false;       // atualizado no Step

// Chamado quando o jogador aperta E perto do objeto e nada mais está acontecendo
on_interact = function() {
	create_textbox(text_id);
};
