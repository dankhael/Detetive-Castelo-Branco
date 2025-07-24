show_debug_message("Creating Cutscene Object");
cutscene = [
	[cutscene_stop_sound, snd_investigation_2],
	[cutscene_wait, 1],
	[cutscene_walk_down, 1, obj_npc_gabriel_1, 30],
	[cutscene_play_sound, snd_reveal],
	[cutscene_textbox, "event 52"],
];

action = 0;

timer = 0;