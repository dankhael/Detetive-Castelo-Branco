event_inherited();
on_interact = function() {
	if (!global.julia_event_1) {
		create_textbox("event 26");
	} else if (!global.julia_quiz) {
		global.julia_quiz = true;
		create_textbox("event 36");
	} else if (global.received_photo) {
		create_textbox("event 46");
	} else if (global.give_magazine) {
		// Troca a revista pela foto (event 42 entrega a foto)
		remove_item("magazine");
		create_textbox("event 42");
	} else if (inventory_has_item("magazine")) {
		global.give_magazine = true;
		create_textbox("event 37");
	} else {
		// Quiz; acertar tudo leva ao event 41, que entrega a foto
		create_textbox("event 38");
	}
};
