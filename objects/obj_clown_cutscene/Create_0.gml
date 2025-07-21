show_debug_message("Creating Cutscene Object");
cutscene = [
	[cutscene_stop_sound, snd_investigation_2],
	[cutscene_wait, 1],
	[cutscene_walk_up, 1, obj_npc_pericia_1, 9.6],
	[cutscene_walk_up, 1, obj_npc_pericia_2, 9.6],
	[cutscene_walk_right, 1, obj_npc_fraga, 4],
	[cutscene_walk_up, 1, obj_npc_fraga, 9],
	[cutscene_walk_right, 1, obj_player, 4],
	[cutscene_walk_up, 1, obj_player, 9],
	[cutscene_play_sound, snd_clown],
	[cutscene_textbox, "event 12"]
];

action = 0;

timer = 0;