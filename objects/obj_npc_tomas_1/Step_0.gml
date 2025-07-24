// Check if player is nearby
if (distance_to_object(obj_player) <= interaction_distance) {
    
    // Show interaction prompt
	if (keyboard_check_pressed(ord("E")) and !global.dialogo and !global.on_cutscene) {
		create_textbox(text_id);
		if (!global.cafeteria_unlocked) {
			global.cafeteria_unlocked = true;
			scr_unlock_location(rm_cafeteria);
			text_id = "event 73";
		}
	}
}