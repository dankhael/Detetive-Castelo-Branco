event_inherited();
if (global.completed_safe_game) {
	if (!global.tomas_event_success) {
		instance_create_depth(0, 0, 0, obj_tomas_cutscene);
	} else {
		x = 480;
		y = 160;
	}
}

// Depois de ver a foto, Tomás conta a verdade (event 45) e depois só repete o event 50
told_truth = global.tomas_event_success;

on_interact = function() {
	if (!global.cafeteria_unlocked) {
		global.cafeteria_unlocked = true;
		create_textbox("event 25");
	} else if (!global.completed_safe_game) {
		create_textbox("event 73");
	} else if (!global.julia_event_1) {
		global.julia_event_1 = true;
		create_textbox("event 35");
	} else if (!global.tomas_event_success) {
		obj_item_manager.start_item_selection(["photo"], 1, "Mostre Alguma Prova",
			function() {
				global.tomas_event_success = true;
				create_textbox("event 44");
			},
			function() {
				create_textbox("event 43");
			}
		);
	} else {
		create_textbox(told_truth ? "event 50" : "event 45");
		told_truth = true;
	}
};
