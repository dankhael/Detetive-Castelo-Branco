// Check if player is nearby
if (distance_to_object(obj_player) <= interaction_distance) {
    
    // Show interaction prompt
	if (keyboard_check_pressed(ord("E")) && !global.dialogo) {
		create_textbox(text_id);
		text_id = "event 7";
		global.patricia_event_1 = true;
	}
}

if (global.patricia_event_1) {
	scr_unlock_location(rm_parque_casa_fraca);
}