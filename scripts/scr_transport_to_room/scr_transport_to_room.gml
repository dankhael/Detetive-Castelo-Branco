function scr_transport_to_room(target_room, spawn_x, spawn_y) {
    global.player_spawn_x = spawn_x;
    global.player_spawn_y = spawn_y;
	show_debug_message("Transporting");
    room_goto(target_room);
}