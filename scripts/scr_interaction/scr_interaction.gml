/// Verdadeiro quando o jogador está livre para andar e interagir com o mundo
/// (sem diálogo, cutscene, inventário ou minigame abertos).
function player_is_free() {
	return !global.dialogo
		and !global.on_cutscene
		and !global.on_inventory
		and !global.in_hidden_object_game;
}

/// Abre o minigame de objetos escondidos definido em global.hidden_object_games
/// @param game_id
function open_hidden_object_game(_game_id) {
	var _game = instance_create_depth(0, 0, -10000, obj_hidden_object_game);
	_game.initialize_game(_game_id);
	global.in_hidden_object_game = true;
}
