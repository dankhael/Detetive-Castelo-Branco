event_inherited();
if (global.finished_puzzle_1) {
	instance_destroy();
	exit;
}
interaction_distance = 32;
show_prompt = true;

on_interact = function() {
	create_textbox("event 47");
	
	// Tomás só entrega a caixa depois que o jogador mostra a foto
	if (global.received_photo) {
		obj_item_manager.start_item_selection(["clipe", "magnet"], 2, "Abra a caixa",
			function() {
				global.finished_puzzle_1 = true;
				add_item("key");
				add_item("mensagem");
				create_textbox("event 49");
				with (obj_metal_box) instance_destroy();
			},
			function() {
				create_textbox("event 75");
			}
		);
	}
};
