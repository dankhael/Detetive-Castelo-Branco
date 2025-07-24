if(!global.nicole_event_1) {
	text_id = "event 21";
} else if (global.call_event_1 and !global.completed_safe_game) {
	text_id = "event 33";
} else if (global.call_event_1 and global.completed_safe_game) {
	text_id = "event 74";
} else {
	text_id = "event 22";
}

interaction_distance = 16;