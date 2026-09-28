event_inherited();
on_interact = function() {
	if (!global.pedro_event_1) {
		global.pedro_event_1 = true;
		create_textbox("event 27");
	} else if (!global.pedro_event_success) {
		create_textbox("event 29");
		obj_item_manager.start_item_selection(["bets"], 1, "Mostre algo util",
			function() {
				global.pedro_event_success = true;
				remove_item("bets");
				add_item("pendrive");
				create_textbox("event 30");
			},
			function() {
				create_textbox("event 71");
			}
		);
	} else {
		create_textbox("event 31");
	}
};
