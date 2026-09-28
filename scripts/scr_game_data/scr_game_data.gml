// Dados do jogo (itens, personagens e minigames de objetos escondidos).
// Chamado uma vez pelo obj_game_controller. Para adicionar conteúdo novo,
// normalmente basta acrescentar uma entrada aqui.

function Item(_name, _description, _sprite) constructor {
	key = "";               // preenchido em scr_init_items com a chave em global.item_list
	name = _name;
	description = _description;
	sprite = _sprite;
}

function scr_init_items() {
	global.item_list = {
		badge : new Item(
			"Distintivo",
			"Meu distintivo de policial, ninguém ia acreditar que eu sou um detetive se eu não o levasse comigo.",
			spr_badge
		),
		notepad : new Item(
			"Caderno",
			"Esse bloco de notas já me ajudou muito, as pessoas subestimam o quão util é anotar seus pensamentos.",
			spr_notepad
		),
		magazine : new Item(
			"Revista Choquetel",
			"A Choquetel sempre faz as melhores revistas de quebra cabeça, fico horas jogando sudoku.",
			spr_magazine
		),
		magnet : new Item(
			"Imã de Neodimio",
			"Um imã de neodimio que eu encontrei na cena do crime, muito util em certas situações...",
			spr_magnet
		),
		bets : new Item(
			"Apostas Esportivas",
			"Um papel com dicas de apostas esportivas, será que é uma sinal pra eu apostar?",
			spr_bets
		),
		nota : new Item(
			"Nota fiscal",
			"Nota fiscal de uma roupa de palhaço, bem esquisito...",
			spr_nota
		),
		pendrive : new Item(
			"Pen Drive",
			"Pen drive com alguns arquivos criptografados e uma chave desenhada, oque a vitima estava escondendo?",
			spr_pendrive
		),
		clipe : new Item(
			"Clipe de Papel",
			"Quem guarda um clipe de papel em um cofre? É melhor ficar com ele de qualquer forma",
			spr_clipe
		),
		bilhete : new Item(
			"Bilhete",
			"1337... oque será que significa? seria um código pra algo?",
			spr_bilhete
		),
		photo : new Item(
			"Foto Secreta",
			"Tomás e Vinicius se encontrando recentemente? e que lugar é esse?",
			spr_photo
		),
		key : new Item(
			"Chave de armário",
			"Chave escondida dentro do armário",
			spr_key
		),
		mensagem : new Item(
			"Mensagem Oculta",
			"'Um rei sempre protege sua rainha', esse cara sempre se comunicava por codigos?",
			spr_mensagem
		),
		decodex : new Item(
			"DecodeX",
			"Então ele existe mesmo?! Vinicius perdeu sua vida por causa desse dispositivo...",
			spr_decodex
		),
		notebook : new Item(
			"Notebook",
			"Sinto que esse notebook contém uma prova vital",
			spr_notebook
		),
		audio : new Item(
			"Audio Secreto",
			"Um audio revelador sobre a situação de vinicius, a outra pessoa no aúdio foi quem o matou!",
			spr_audio
		),
	};

	var _keys = struct_get_names(global.item_list);
	for (var i = 0; i < array_length(_keys); i++) {
		global.item_list[$ _keys[i]].key = _keys[i];
	}
}

/// Retratos usados por scr_text. side: 1 = retrato à esquerda, -1 = à direita
function scr_init_speakers() {
	global.speakers = {};

	var _add = function(_name, _sprite, _side = -1) {
		global.speakers[$ _name] = { sprite: _sprite, side: _side };
	};

	_add("castelo branco",    spr_castelo_normal_portrait, 1);
	_add("castelo atrasado",  spr_castelo_atrasado_portrait, 1);
	_add("castelo tedio",     spr_castelo_tedio_portrait, 1);
	_add("misterioso",        spr_misterioso_portrait, 1);
	_add("guarda belo",       spr_belo_normal_portrait);
	_add("belo surpreso",     spr_belo_surpreso_portrait);
	_add("delegada patricia", spr_patricia_normal_portrait);
	_add("patricia sorriso",  spr_patricia_sorriso_portrait);
	_add("agente fraga",      spr_fraga_normal_portrait);
	_add("fraga rindo",       spr_fraga_rindo_portrait);
	_add("pericia 1",         spr_pericia_1_portrait);
	_add("pericia 2",         spr_pericia_2_portrait);
	_add("palhaço",           spr_clown_portrait);
	_add("nicole chorando",   spr_nicole_chorando_portrait);
	_add("nicole triste",     spr_nicole_triste_portrait);
	_add("nicole carvalho",   spr_nicole_carvalho_portrait);
	_add("lucas carvalho",    spr_lucas_carvalho_portrait);
	_add("tomás xavier",      spr_tomas_portrait);
	_add("pedro melo",        spr_pedro_portrait);
	_add("gabriel borges",    spr_gabriel_portrait);
	_add("julia alves",       spr_julia_portrait);
	_add("julia animada",     spr_julia_animada_portrait);
	_add("garconete",         spr_garconete_portrait);
	_add("vinicius carvalho", spr_vinicius_portrait);
}

/// Minigames de objetos escondidos (abertos com open_hidden_object_game).
///   background      : sprite de fundo
///   completed_flag  : nome da variável global marcada quando todos os objetos são achados
///   completion_text : diálogo mostrado ao terminar
///   objects         : x/y relativos ao fundo; is_item adiciona ao inventário (key = chave do item)
function scr_init_hidden_object_games() {
	global.hidden_object_games = {
		table_game : {
			background: spr_table_base,
			completed_flag: "completed_table_game",
			completion_text: "event 2",
			objects: [
				{ key: "badge",   sprite: spr_badge,   x: 100, y: 440, is_item: true },
				{ key: "notepad", sprite: spr_notepad, x: 350, y: 325, is_item: true },
			],
		},
		crime_game : {
			background: spr_crime_base,
			completed_flag: "completed_crime_game",
			completion_text: "event 19",
			objects: [
				{ key: "magnet", sprite: spr_magnet_shrink, x: 200, y: 400, is_item: true },
				{ key: "bets",   sprite: spr_bets_shrink,   x: 360, y: 350, is_item: true },
			],
		},
		vini_house_game : {
			background: spr_vini_table_base,
			completed_flag: "completed_vini_house_game",
			completion_text: "event 23",
			objects: [
				{ key: "chess", sprite: spr_chess_game, x: 306, y: 410, is_item: false },
				{ key: "nota",  sprite: spr_nota,       x: 280, y: 180, is_item: true },
			],
		},
		safe_game : {
			background: spr_safe_base,
			completed_flag: "completed_safe_game",
			completion_text: "event 34",
			objects: [
				{ key: "clipe",   sprite: spr_clipe_shrink,   x: 180, y: 560, is_item: true },
				{ key: "bilhete", sprite: spr_bilhete_shrink, x: 240, y: 570, is_item: true },
			],
		},
	};
}
