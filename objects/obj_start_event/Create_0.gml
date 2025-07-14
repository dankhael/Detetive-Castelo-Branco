text_id = "event 1";
if (global.game_start) {
	global.game_start = false;
	audio_play_sound(snd_goof, 1, true);
	create_textbox(text_id);
}