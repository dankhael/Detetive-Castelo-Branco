if (keyboard_check_pressed(vk_escape)) {
	close_game();
	exit;
}

if (!mouse_check_button_pressed(mb_left)) exit;

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

if (point_on(exit_button, _mx, _my)) {
	close_game();
	exit;
}

for (var i = 0; i < array_length(hidden_objects); i++) {
	var _obj = hidden_objects[i];
	if (_obj.found or !point_on(_obj, _mx, _my)) continue;
	
	_obj.found = true;
	if (_obj.is_item) {
		add_item(_obj.key);
	}
	audio_play_sound(snd_item_found, 1, false);
	check_completion();
	break;
}
