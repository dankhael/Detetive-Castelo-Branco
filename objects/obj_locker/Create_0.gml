event_inherited();
interaction_distance = 32;
show_prompt = true;

on_interact = function() {
	// A dica do armário vem da conversa no metrô (event 53)
	if (!global.cafe_locker) {
		create_textbox("event 77");
		return;
	}
	create_textbox("event 56");
	global.open_locker = true;
	add_item("decodex");
	add_item("notebook");
};
