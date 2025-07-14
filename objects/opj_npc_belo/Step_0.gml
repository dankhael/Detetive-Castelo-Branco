// Check if player is nearby
if (distance_to_object(obj_player) <= interaction_distance) {
    
    // Show interaction prompt
	if (keyboard_check_pressed(ord("E")) && !global.dialogo) {
		create_textbox(text_id);
		text_id = "event 5";
		global.belo_event_1 = true;
	}
}

if (global.received_magazine) {
	add_item("magazine");
	global.received_magazine = false;
}