event_inherited();
hidden_game_id = "safe_game";

// O cofre só aparece depois da invasão da casa (ligação do event 32)
if (!global.call_event_1) {
	instance_destroy();
}
