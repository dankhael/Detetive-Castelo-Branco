// Check if player is nearby
if (distance_to_object(obj_player) <= interaction_distance) {
    
    // Show interaction prompt
	if (keyboard_check_pressed(ord("E")) and !global.dialogo and !global.on_cutscene) {
		if (global.julia_event_1 and !global.julia_quiz) {
			text_id = "event 36";
			global.julia_quiz = true;
		} else if (global.julia_quiz and inventory_has_item("magazine")) {
			text_id = "event 37";
			global.give_magazine = true;
		} else if (global.julia_quiz and !inventory_has_item("magazine") and !global.julia_quiz_completed) {
			text_id = "event 38";
		} else if (global.julia_quiz and global.give_magazine) {
			text_id = "event 42";
			remove_item("magazine");
		} else if (global.julia_quiz and global.received_photo) {
			text_id = "event 46"
		}
		create_textbox(text_id);
	}
}

if (global.received_photo and !inventory_has_item("photo")) {
	add_item("photo");
}