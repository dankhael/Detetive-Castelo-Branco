function scr_unlock_location(room_to_unlock) {
    for (var i = 0; i < ds_list_size(global.map_locations); i++) {
        var location = ds_list_find_value(global.map_locations, i);
        if (ds_map_find_value(location, "room") == room_to_unlock) {
            ds_map_replace(location, "unlocked", true);
            return true;
        }
    }
    return false;
}