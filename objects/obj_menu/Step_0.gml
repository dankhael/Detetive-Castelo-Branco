// If player presses ENTER -> Go to gameplay room
if (keyboard_check_pressed(vk_enter)) {
    room_goto(rm_quarto); // Replace with your game room's name
}

// If player presses ESC -> Exit the game
if (keyboard_check_pressed(vk_escape)) {
    game_end();
}
