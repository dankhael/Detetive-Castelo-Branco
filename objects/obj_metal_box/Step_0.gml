// Check if player is nearby
if (distance_to_object(obj_player) <= interaction_distance) {
    
    // Show interaction prompt
	if (keyboard_check_pressed(ord("E")) and !global.dialogo and !global.on_cutscene and !global.on_inventory) {
		create_textbox(text_id);
		if (global.received_photo and !global.finished_puzzle_1) {
			var inv_obj = obj_item_manager.start_item_selection(["clipe", "magnet"], 2, "Abra a caixa", scr_metal_item_success, scr_metal_item_fail)
		}
		
	}
}

if (global.finished_puzzle_1) {
	instance_destroy()
}