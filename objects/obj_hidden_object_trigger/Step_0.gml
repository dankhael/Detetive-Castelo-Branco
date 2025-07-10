// Check if player is nearby
if (distance_to_object(obj_player) <= interaction_distance) {
    can_interact = true;
    
    // Show interaction prompt
	if (keyboard_check_pressed(ord("E")) && !global.in_hidden_object_game) {
	    // Create the hidden object game
	    var game = instance_create_layer(0, 0, "UI", obj_hidden_object_game);
	    game.hidden_game_id = "table_game";
	    game.initialize_game(); // Call initialization after setting the ID
	    global.in_hidden_object_game = true;
	}
} else {
    can_interact = false;
}