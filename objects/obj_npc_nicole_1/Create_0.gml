event_inherited();
on_interact = function() {
	if (!global.nicole_event_1) {
		global.nicole_event_1 = true;
		create_textbox("event 21");
	} else if (global.call_event_1) {
		create_textbox(global.completed_safe_game ? "event 74" : "event 33");
	} else {
		create_textbox("event 22");
	}
};
