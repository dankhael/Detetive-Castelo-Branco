// Check if player is nearby
if (distance_to_object(obj_player) <= interaction_distance) {
    can_interact = true;
    // Show interaction prompt
	if (keyboard_check_pressed(ord("E")) and !global.dialogo and !global.on_cutscene) {
		if(global.cafe_locker) {
			create_textbox(text_id);
			global.open_locker = true;
			add_item("decodex");
			add_item("notebook");
		} else {
			create_textbox("event 77");
		}
	}
} else {
	can_interact = false;
}