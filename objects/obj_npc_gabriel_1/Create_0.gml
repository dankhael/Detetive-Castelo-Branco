if(!global.finished_puzzle_1) {
	text_id = "event 76";
} else {
	if (global.gabriel_event_1){
		instance_destroy();
	}
	instance_create_layer(0, 0, "Instances", obj_gabriel_cutscene);
	text_id = "event 51";
}

interaction_distance = 16;