event_inherited();
if (global.cutscene_1_start) {
	x = 670;
	y = 445;
}
on_interact = function() {
	create_textbox(global.cutscene_1_start ? "event 13" : "event 10");
};
