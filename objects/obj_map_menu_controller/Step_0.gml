var location_count = ds_list_size(global.map_locations);

// Navigation
if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
    selected_location--;
    if (selected_location < 0) selected_location = location_count - 1;
}

if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
    selected_location++;
    if (selected_location >= location_count) selected_location = 0;
}

// Selection
if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
    var location = ds_list_find_value(global.map_locations, selected_location);
	show_debug_message("LOCATION NAME: " + ds_map_find_value(location, "name"));
    if (ds_map_find_value(location, "unlocked")) {
		show_debug_message("UNLOCKED MAP")
        var target_room = ds_map_find_value(location, "room");
        var spawn_x = ds_map_find_value(location, "spawn_x");
        var spawn_y = ds_map_find_value(location, "spawn_y");
        scr_transport_to_room(target_room, spawn_x, spawn_y);
    }
}

// Back/Cancel
if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("Q"))) {
    if (global.current_return_room != -1) {
        room_goto(global.current_return_room);
    }
}