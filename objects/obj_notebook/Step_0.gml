// Check if player is nearby
if (distance_to_object(obj_player) <= interaction_distance) {
    
    // Show interaction prompt
	if (keyboard_check_pressed(ord("E")) and !global.dialogo and !global.on_cutscene) {
		create_textbox(text_id);
		var inv_obj = obj_item_manager
		inv_obj.start_password_entry("1337", "Coloque a senha:", scr_password_success(), scr_password_fail());
		if (global.password_unlocked) {
			inv_obj.start_item_selection(["pendrive"], 1, "Coloque a 'chave': ", scr_pendrive_item_success(), scr_pendrive_item_fail());
			if(global.received_audio) {
				add_item("audio");
			}
		}
	}
}