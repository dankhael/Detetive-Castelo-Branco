// Abre um minigame de objetos escondidos (ver scr_init_hidden_object_games).
// Filhos só precisam trocar hidden_game_id.
event_inherited();
interaction_distance = 32;
show_prompt = true;
hidden_game_id = "table_game";

on_interact = function() {
	open_hidden_object_game(hidden_game_id);
};
