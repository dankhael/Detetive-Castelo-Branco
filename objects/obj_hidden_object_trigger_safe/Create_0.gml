// Interaction variables
can_interact = false;
interaction_distance = 32;
examine_triggered = false;

// Reference to the hidden object game
hidden_object_id = "safe_game"; // Unique identifier

if (!global.call_event_1) {
	instance_destroy();
}