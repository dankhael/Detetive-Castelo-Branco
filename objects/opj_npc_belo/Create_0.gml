event_inherited();
on_interact = function() {
	create_textbox(global.belo_event_1 ? "event 5" : "event 3");
	global.belo_event_1 = true;
};
