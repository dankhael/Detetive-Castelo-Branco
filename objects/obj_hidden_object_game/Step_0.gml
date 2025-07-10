// Handle mouse input
if (mouse_check_button_pressed(mb_left)) {
    mouse_clicked = true;
    var mouse_gui_x = device_mouse_x_to_gui(0);
    var mouse_gui_y = device_mouse_y_to_gui(0);
    
    // Check exit button
    if (point_in_rectangle(mouse_gui_x, mouse_gui_y, 
        exit_button.x - exit_button.width/2, 
        exit_button.y - exit_button.height/2,
        exit_button.x + exit_button.width/2, 
        exit_button.y + exit_button.height/2)) {
        close_game();
    }
    
    // Check hidden objects
    for (var i = 0; i < array_length(hidden_objects); i++) {
        var obj = hidden_objects[i];
        if (!obj.found) {
            if (point_in_rectangle(mouse_gui_x, mouse_gui_y,
                obj.x - obj.width/2, obj.y - obj.height/2,
                obj.x + obj.width/2, obj.y + obj.height/2)) {
                
                // Object found!
                obj.found = true;
                hidden_objects[i] = obj;
				audio_play_sound(snd_item_found, 1, false);
                
                // Save state
                save_game_state();
				
				check_completion();
                
                // Optional: Play sound effect
                // audio_play_sound(snd_item_found, 1, false);
                
                // Optional: Show found message
                show_debug_message("Found: " + obj.id);
                break;
            }
        }
    }
}

// Handle ESC key
if (keyboard_check_pressed(vk_escape)) {
    close_game();
}

// In Step Event, check if all objects are found
function check_completion() {
    var all_found = true;
    for (var i = 0; i < array_length(hidden_objects); i++) {
        if (!hidden_objects[i].found) {
            all_found = false;
            break;
        }
    }
    
    if (all_found and hidden_game_id == "table_game") {
		close_game();
		// Start initial dialog
		var npc = instance_create_layer(x, y, "Instances_1", obj_found_event);
		var dialogo = instance_create_layer(x, y, "Dialogo", obj_dialog);
		dialogo.npc_nome = npc.nome;
		global.dialogo = true;
    }
}

// In obj_hidden_object_game Step Event, add this:
if (keyboard_check_pressed(ord("R"))) {
    reset_game_state();
}