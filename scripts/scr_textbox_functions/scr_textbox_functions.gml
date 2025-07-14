function scr_set_defaults_for_text() {
	speaker_sprite[page_number] = noone;
	speaker_side[page_number] = 1;
}


/// @param text
/// @param [character]
function scr_text(_text) {
	scr_set_defaults_for_text();
	
	text[page_number] = _text;
	
	//get character info
	if (argument_count > 1) {
		switch(argument[1]) {
			case "castelo branco":
				speaker_sprite[page_number] = spr_castelo_normal_portrait;
				break;
			case "castelo atrasado":
				speaker_sprite[page_number] = spr_castelo_atrasado_portrait;
				break;
			case "castelo tedio":
				speaker_sprite[page_number] = spr_castelo_tedio_portrait;
				break;
			case "guarda belo":
				speaker_sprite[page_number] = spr_belo_normal_portrait;
				speaker_side[page_number] = -1;
				break;
			case "belo surpreso":
				speaker_sprite[page_number] = spr_belo_surpreso_portrait;
				speaker_side[page_number] = -1;
				break;
			case "delegada patricia":
				speaker_sprite[page_number] = spr_patricia_normal_portrait;
				speaker_side[page_number] = -1;
				break;
			case "patricia sorriso":
				speaker_sprite[page_number] = spr_patricia_sorriso_portrait;
				speaker_side[page_number] = -1;
				break;
		} 
	} else {
		speaker_sprite[page_number] = noone;
	}
	
	page_number++
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
	with (instance_create_depth(0, 0 , -9999, obj_textbox)) {
		scr_game_text(_text_id);
	}
}