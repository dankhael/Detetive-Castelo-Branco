// Check if player is nearby
if (distance_to_object(obj_player) <= interaction_distance) {
    
    // Show interaction prompt
	if (keyboard_check_pressed(ord("E")) and !global.dialogo and !global.on_cutscene) {
		create_textbox(text_id);
		if (!global.nicole_event_1) {
			text_id = "event 22";
			global.nicole_event_1 = true;
		}

	}
}

if (global.orpheus_house_unlocked) {
	scr_unlock_location(rm_casa_de_orfeu);
}