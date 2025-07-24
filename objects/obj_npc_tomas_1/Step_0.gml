// Check if player is nearby
if (distance_to_object(obj_player) <= interaction_distance) {
    
    // Show interaction prompt
	if (keyboard_check_pressed(ord("E")) and !global.dialogo and !global.on_cutscene) {
		if (global.completed_safe_game and !global.julia_event_1) {
			create_textbox(text_id);
		} else if (global.completed_safe_game and global.julia_event_1 and !global.tomas_event_success) {
			var inv_obj = obj_item_manager.start_item_selection(["photo"], 1, "Mostre Alguma Prova", scr_tomas_item_success, scr_tomas_item_fail);
			
			if (global.tomas_event_success) {
				create_textbox("event 44");
				text_id = "event 45";
			}
		} else if (global.completed_safe_game and global.julia_event_1 and global.tomas_event_success) {
			create_textbox("event 45");
		} 
		
		if (!global.cafeteria_unlocked) {
			create_textbox(text_id);
			global.cafeteria_unlocked = true;
			scr_unlock_location(rm_cafeteria);
			text_id = "event 73";
		} else if (global.completed_safe_game) {
			global.julia_event_1 = true;
		}
	}
}