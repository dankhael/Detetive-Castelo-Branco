if (ds_exists(global.map_locations, ds_type_list)) {
    for (var i = 0; i < ds_list_size(global.map_locations); i++) {
        var location = ds_list_find_value(global.map_locations, i);
        ds_map_destroy(location);
    }
    ds_list_destroy(global.map_locations);
}