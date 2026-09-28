// Minigame de objetos escondidos. Criado por open_hidden_object_game(),
// que chama initialize_game() com um id de global.hidden_object_games.

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

background_x = gui_width / 3;
background_y = gui_height / 8;

hidden_game_id = "";
definition = undefined;
background_sprite = -1;
hidden_objects = [];

exit_button = {
	sprite: spr_exit_button,
	x: gui_width - 60,
	y: 40,
	width: sprite_get_width(spr_exit_button),
	height: sprite_get_height(spr_exit_button),
};

function initialize_game(_game_id) {
	hidden_game_id = _game_id;
	definition = global.hidden_object_games[$ _game_id];
	background_sprite = definition.background;
	hidden_objects = [];
	
	// Jogo já completado: mostra só o fundo
	if (variable_global_get(definition.completed_flag)) return;
	
	for (var i = 0; i < array_length(definition.objects); i++) {
		var _def = definition.objects[i];
		array_push(hidden_objects, {
			key: _def.key,
			sprite: _def.sprite,
			x: background_x + _def.x,
			y: background_y + _def.y,
			width: sprite_get_width(_def.sprite),
			height: sprite_get_height(_def.sprite),
			found: false,
			is_item: _def.is_item,
		});
	}
}

/// Verdadeiro se o ponto (_x, _y) está dentro de _obj (sprites com origem no centro)
function point_on(_obj, _x, _y) {
	return point_in_rectangle(_x, _y,
		_obj.x - _obj.width / 2, _obj.y - _obj.height / 2,
		_obj.x + _obj.width / 2, _obj.y + _obj.height / 2);
}

function count_found() {
	var _found = 0;
	for (var i = 0; i < array_length(hidden_objects); i++) {
		if (hidden_objects[i].found) _found++;
	}
	return _found;
}

function close_game() {
	global.in_hidden_object_game = false;
	instance_destroy();
}

function check_completion() {
	if (count_found() < array_length(hidden_objects)) return;
	
	close_game();
	variable_global_set(definition.completed_flag, true);
	create_textbox(definition.completion_text);
}
