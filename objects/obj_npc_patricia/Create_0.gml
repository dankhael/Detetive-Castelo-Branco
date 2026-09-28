event_inherited();
on_interact = function() {
	create_textbox(global.patricia_event_1 ? "event 7" : "event 6");
	global.patricia_event_1 = true;
};
