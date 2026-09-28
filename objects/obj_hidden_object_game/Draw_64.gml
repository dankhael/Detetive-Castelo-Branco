// Fundo escurecido
draw_set_alpha(0.8);
draw_rectangle_color(0, 0, gui_width, gui_height, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

draw_sprite(background_sprite, 0, background_x, background_y);

// Objetos ainda não encontrados, com destaque sob o mouse
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

for (var i = 0; i < array_length(hidden_objects); i++) {
	var _obj = hidden_objects[i];
	if (_obj.found) continue;
	
	draw_sprite(_obj.sprite, 0, _obj.x, _obj.y);
	
	if (point_on(_obj, _mx, _my)) {
		draw_set_alpha(0.3);
		draw_rectangle_color(_obj.x - _obj.width / 2, _obj.y - _obj.height / 2,
			_obj.x + _obj.width / 2, _obj.y + _obj.height / 2,
			c_yellow, c_yellow, c_yellow, c_yellow, false);
		draw_set_alpha(1);
	}
}

draw_sprite(exit_button.sprite, 0, exit_button.x, exit_button.y);

draw_set_color(c_white);
draw_text(20, 20, "Found: " + string(count_found()) + "/" + string(array_length(hidden_objects)));
