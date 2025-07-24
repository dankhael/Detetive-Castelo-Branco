if (global.cafeteria_unlocked) {
	if (global.completed_safe_game) {
		text_id = "event 35"
		if (!global.tomas_event_success) {
			instance_create_layer(0, 0, "Instances_1", obj_tomas_cutscene);
		} else {
			x = 480;
			y = 160;
			text_id = "event 50";
		}
	} else {
		text_id = "event 73"
	}
} else {
	text_id = "event 25";
}


interaction_distance = 16;