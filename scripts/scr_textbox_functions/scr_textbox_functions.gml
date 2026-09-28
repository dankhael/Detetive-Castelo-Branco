/// Adiciona uma página ao textbox atual
/// @param text
/// @param [speaker]  nome de um personagem em global.speakers (scr_game_data)
function scr_text(_text, _speaker = undefined) {
	text[page_number] = _text;
	speaker_sprite[page_number] = noone;
	speaker_side[page_number] = 1;
	
	if (_speaker != undefined) {
		var _data = global.speakers[$ _speaker];
		if (_data == undefined) {
			show_debug_message("AVISO: personagem sem retrato: " + _speaker);
		} else {
			speaker_sprite[page_number] = _data.sprite;
			speaker_side[page_number] = _data.side;
		}
	}
	
	page_number++;
}

/// @param option
/// @param link_id
function scr_option(_option, _link_id) {
	option[option_number] = _option;
	option_link_id[option_number] = _link_id;
	
	option_number++;
}

/// @param text_id
function create_textbox(_text_id) {
	with (instance_create_depth(0, 0, -9999, obj_textbox)) {
		scr_game_text(_text_id);
	}
}
