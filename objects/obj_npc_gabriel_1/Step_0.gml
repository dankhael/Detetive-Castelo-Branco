// Check if player is nearby
if (distance_to_object(obj_player) <= interaction_distance) {
    
    // Show interaction prompt
	if (keyboard_check_pressed(ord("E")) and !global.dialogo and !global.on_cutscene) {
		if (global.finished_puzzle_1 and !global.gabriel_event_1) {
			obj_player.x += 10;
			global.gabriel_event_1 = true;
			create_textbox(text_id);
			scr_unlock_location(rm_metro)
		} else {
			create_textbox(text_id);
		}
		

	}
}

if (global.completed_crime_game) {
	scr_unlock_location(rm_casa_vinicius);
}