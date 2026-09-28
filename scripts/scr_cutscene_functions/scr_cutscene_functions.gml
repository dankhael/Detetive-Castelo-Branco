// Ações de cutscene. Rodam no escopo de um filho de obj_cutscene_parent,
// que as chama com os argumentos definidos no array `cutscene`.

/// Executa um passo da ação atual
function cutscene_step() {
	global.on_cutscene = true;
	var _action = cutscene[action];
	script_execute_ext(_action[0], _action, 1);
}

function action_end() {
	action++;
	
	if (action >= array_length(cutscene)) {
		global.on_cutscene = false;
		instance_destroy();
	}
}

/// Conta os frames da ação atual e a encerra depois de _seconds
function cutscene_tick(_seconds) {
	timer++;
	
	if (timer >= game_get_speed(gamespeed_fps) * _seconds) {
		timer = 0;
		action_end();
	}
}

function cutscene_wait(_seconds) {
	cutscene_tick(_seconds);
}

/// Move _obj (_dx, _dy) pixels por frame durante _seconds
function cutscene_move(_seconds, _obj, _dx, _dy) {
	_obj.x += _dx;
	_obj.y += _dy;
	cutscene_tick(_seconds);
}

function cutscene_walk_right(_seconds, _obj, _spd) {
	cutscene_move(_seconds, _obj, _spd, 0);
}

function cutscene_walk_left(_seconds, _obj, _spd) {
	cutscene_move(_seconds, _obj, -_spd, 0);
}

function cutscene_walk_up(_seconds, _obj, _spd) {
	cutscene_move(_seconds, _obj, 0, -_spd);
}

function cutscene_walk_down(_seconds, _obj, _spd) {
	cutscene_move(_seconds, _obj, 0, _spd);
}

function cutscene_stop_sound(_sound) {
	audio_stop_sound(_sound);
	action_end();
}

function cutscene_play_sound(_sound) {
	audio_play_sound(_sound, 0, true);
	action_end();
}

function cutscene_textbox(_text_id) {
	create_textbox(_text_id);
	action_end();
}
