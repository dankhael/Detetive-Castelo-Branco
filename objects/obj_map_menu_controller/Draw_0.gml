draw_set_font(-1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Title
draw_set_color(c_white);
draw_text(room_width/2, 50, "MAP MENU");
draw_text(room_width/2, room_height - 50, "ENTER: Select | ESC: Back | Arrow Keys: Navigate");

// Draw location buttons
for (var i = 0; i < ds_list_size(global.map_locations); i++) {
    var location = ds_list_find_value(global.map_locations, i);
    var is_unlocked = ds_map_find_value(location, "unlocked");
    var location_name = ds_map_find_value(location, "name");
    
    var button_x = room_width/2 - button_width/2;
    var button_y = menu_start_y + (i * (button_height + 10));
    
    // Button background
    if (i == selected_location) {
        draw_set_color(is_unlocked ? c_yellow : c_red);
    } else {
        draw_set_color(is_unlocked ? c_green : c_gray);
    }
    
    draw_rectangle(button_x, button_y, button_x + button_width, button_y + button_height, false);
    
    // Button border
    draw_set_color(c_black);
    draw_rectangle(button_x, button_y, button_x + button_width, button_y + button_height, true);
    
    // Button text
    draw_set_color(is_unlocked ? c_black : c_dkgray);
    var display_text = is_unlocked ? location_name : ("??? " + location_name);
    draw_text(button_x + button_width/2, button_y + button_height/2, display_text);
}