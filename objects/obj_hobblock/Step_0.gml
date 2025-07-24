if position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb_left) {
		var game = instance_create_layer(0, 0, "UI", obj_hidden_object_game);
	    game.hidden_game_id = "safe_game";
	    game.initialize_game(); // Call initialization after setting the ID
	    global.in_hidden_object_game = true;
}