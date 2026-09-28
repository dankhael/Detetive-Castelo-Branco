event_inherited();
if (global.gabriel_event_1) {
	instance_destroy();
	exit;
}
if (global.finished_puzzle_1) {
	instance_create_depth(0, 0, 0, obj_gabriel_cutscene);
}

on_interact = function() {
	if (global.finished_puzzle_1) {
		obj_player.x += 10;
		global.gabriel_event_1 = true;
		create_textbox("event 51");
	} else {
		create_textbox("event 76");
	}
};
