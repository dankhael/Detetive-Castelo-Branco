function action_end() {
	action++;
	
	if (action >= array_length(cutscene)) {
		global.on_cutscene = false;
		instance_destroy();
	}
}

function cutscene_wait(_seconds) {
		timer++;
		_gamespeed = game_get_speed(gamespeed_fps) * _seconds;
		//show_debug_message("Timer: " + string(timer));
		//show_debug_message("GameSpeed: " + string(_gamespeed));
		
		if (timer >= _gamespeed) {
			timer = 0;
			action_end();
		}
}

function cutscene_walk_right(_seconds, _obj, _spd) {
		timer++;
		_obj.x += _spd;
		
		if (timer >= game_get_speed(gamespeed_fps) * _seconds) {
			timer = 0;
			action_end();
		}
}

function cutscene_walk_left(_seconds, _obj, _spd) {
		timer++;
		_obj.x -= _spd;
		
		if (timer >= game_get_speed(gamespeed_fps) * _seconds) {
			timer = 0;
			action_end();
		}
}

function cutscene_walk_up(_seconds, _obj, _spd) {
		timer++;
		_obj.y -= _spd;
		
		if (timer >= game_get_speed(gamespeed_fps) * _seconds) {
			timer = 0;
			action_end();
		}
}

function cutscene_walk_down(_seconds, _obj, _spd) {
		timer++;
		_obj.y += _spd;
		
		if (timer >= game_get_speed(gamespeed_fps) * _seconds) {
			timer = 0;
			action_end();
		}
}

function cutscene_stop_sound(_sound) {
		audio_stop_sound(_sound);
		action_end();
}

function cutscene_play_sound(_sound) {
		audio_play_sound(_sound, 0, true);
		action_end();
}

function cutscene_textbox (_text_id) {
		create_textbox(_text_id);
		action_end();
}