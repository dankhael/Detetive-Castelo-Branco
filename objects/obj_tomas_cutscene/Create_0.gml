event_inherited();
cutscene = [
	[cutscene_stop_sound, snd_investigation_2],
	[cutscene_stop_sound, snd_investigation],
	[cutscene_wait, 1],
	[cutscene_walk_up, 1, obj_npc_tomas_1, 9.6],
	[cutscene_play_sound, snd_reveal],
];
can_start = function() {
	return global.tomas_event_success;
};
