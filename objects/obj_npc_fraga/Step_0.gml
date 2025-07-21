// Check if player is nearby
if (distance_to_object(obj_player) <= interaction_distance) {
    
    // Show interaction prompt
	if (keyboard_check_pressed(ord("E")) and !global.dialogo and !global.on_cutscene) {
		if (!global.fraga_event_1) {
			obj_player.x = 480;
			obj_player.y = 1150;
		}
		if (global.completed_crime_game) {
			text_id = "event 20";
		}
		create_textbox(text_id);
		if (!global.completed_crime_game) {
			text_id = "event 9";
		} else {
			text_id = "event 20";
		}
		global.fraga_event_1 = true;
		global.cutscene_1_start = true;
	}
}

if (global.completed_crime_game) {
	scr_unlock_location(rm_casa_vinicius);
}