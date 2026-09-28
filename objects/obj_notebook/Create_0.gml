event_inherited();
if (!global.open_locker) {
	instance_destroy();
	exit;
}
interaction_distance = 32;
show_prompt = true;

// Primeiro a senha (1337, do bilhete do cofre), depois a "chave" (pendrive)
on_interact = function() {
	if (!global.password_unlocked) {
		create_textbox("event 57");
		obj_item_manager.start_password_entry("1337", "Coloque a senha:",
			function() {
				global.password_unlocked = true;
				create_textbox("event 58");
			},
			function() {
				create_textbox("event 78");
			}
		);
	} else if (!global.received_audio) {
		obj_item_manager.start_item_selection(["pendrive"], 1, "Coloque a 'chave':",
			function() {
				create_textbox("event 60"); // entrega o áudio
			},
			function() {
				create_textbox("event 79");
			}
		);
	}
};
