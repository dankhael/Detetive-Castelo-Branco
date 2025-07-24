// Check if player is nearby
if (distance_to_object(obj_player) <= interaction_distance) {
    
    // Show interaction prompt
	if (keyboard_check_pressed(ord("E")) and !global.dialogo and !global.on_cutscene and !global.on_inventory) {
		create_textbox(text_id);
		if (global.pedro_event_1 and !global.pedro_event_success) {
			var inv_obj = obj_item_manager.start_item_selection(["bets"], 1, "Mostre algo util", scr_pedro_item_success, scr_pedro_item_fail)
			if (global.pedro_event_success) {
				text_id = "event 31"
			}
		} else if (global.pedro_event_1 and global.pedro_event_success) {
			text_id = "event 31"
		} else {
			global.pedro_event_1 = true;
			text_id = "event 29"
		}
		
	}
}