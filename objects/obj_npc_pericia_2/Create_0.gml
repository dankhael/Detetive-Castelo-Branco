event_inherited();
if (global.cutscene_1_start) {
	x = 767;
	y = 445;
}
on_interact = function() {
	create_textbox(global.cutscene_1_start ? "event 14" : "event 11");
};
