event_inherited();
if (!global.fraga_event_1) {
	instance_create_depth(0, 0, 0, obj_clown_cutscene);
} else {
	x = 730;
	y = 510;
}

on_interact = function() {
	if (!global.fraga_event_1) {
		// Posiciona o jogador para a cutscene dos palhaços
		obj_player.x = 480;
		obj_player.y = 1150;
		global.fraga_event_1 = true;
		global.cutscene_1_start = true;
		create_textbox("event 8");
	} else {
		create_textbox(global.completed_crime_game ? "event 20" : "event 9");
	}
};
