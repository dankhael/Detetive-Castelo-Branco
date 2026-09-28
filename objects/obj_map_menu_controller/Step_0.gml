var location_count = array_length(global.map_locations);

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
    var location = global.map_locations[selected_location];
    if (location.unlocked) {
        scr_transport_to_room(location.target_room, location.spawn_x, location.spawn_y);
    }
}

// Back/Cancel
if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("Q"))) {
    if (global.current_return_room != -1) {
        room_goto(global.current_return_room);
    }
}
