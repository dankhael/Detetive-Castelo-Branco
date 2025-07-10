// Draw semi-transparent background
draw_set_alpha(0.8);
draw_rectangle_color(0, 0, gui_width, gui_height, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

// Draw main background image FIRST
draw_sprite(background_sprite, 0, background_x, background_y);
show_debug_message("Drawing main image");

// Draw hidden objects that haven't been found
for (var i = 0; i < array_length(hidden_objects); i++) {
    var obj = hidden_objects[i];
    if (!obj.found) {
        // Debug: Show what we're trying to draw
        show_debug_message("Drawing object " + obj.id + " at " + string(obj.x) + ", " + string(obj.y));
        
        // Draw the sprite
        draw_sprite(obj.sprite, 0, obj.x, obj.y);
    }
}

// Draw hover highlights AFTER the sprites
var mouse_gui_x = device_mouse_x_to_gui(0);
var mouse_gui_y = device_mouse_y_to_gui(0);
for (var i = 0; i < array_length(hidden_objects); i++) {
    var obj = hidden_objects[i];
    if (!obj.found) {
        if (point_in_rectangle(mouse_gui_x, mouse_gui_y,
            obj.x - obj.width/2, obj.y - obj.height/2,
            obj.x + obj.width/2, obj.y + obj.height/2)) {
            
            // Draw highlight
            draw_set_alpha(0.3);
            draw_rectangle_color(obj.x - obj.width/2, obj.y - obj.height/2,
                obj.x + obj.width/2, obj.y + obj.height/2,
                c_yellow, c_yellow, c_yellow, c_yellow, false);
            draw_set_alpha(1);
        }
    }
}

// Draw exit button
draw_sprite(exit_button.sprite, 0, exit_button.x, exit_button.y);

// Draw found counter
var found_count = 0;
for (var i = 0; i < array_length(hidden_objects); i++) {
    if (hidden_objects[i].found) found_count++;
}
draw_set_color(c_white);
draw_text(20, 20, "Found: " + string(found_count) + "/" + string(array_length(hidden_objects)));