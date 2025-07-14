// Game identification
hidden_game_id = "";

// Display settings
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

// Background image
background_sprite = spr_table_base;
background_x = gui_width / 3;
background_y = gui_height / 8;

// Hidden objects array - Define all possible hidden objects
hidden_objects = [];

// Exit button
exit_button = {
    sprite: spr_exit_button,
    x: gui_width - 60,
    y: 40,
    width: sprite_get_width(spr_exit_button),
    height: sprite_get_height(spr_exit_button)
};

// Input handling
mouse_clicked = false;

// Function: close_game
function close_game() {
    global.in_hidden_object_game = false;
	global.block_menus = false;
    instance_destroy();
}

//// Function: save_game_state
//function save_game_state() {
//    var save_data = {};
//    save_data.objects = [];
    
//    for (var i = 0; i < array_length(hidden_objects); i++) {
//        var obj_data = {
//            id: hidden_objects[i].id,
//            found: hidden_objects[i].found
//        };
//        array_push(save_data.objects, obj_data);
//    }
    
//    // Save to file or global variable
//    var json_string = json_stringify(save_data);
//    var file = file_text_open_write("hidden_game_" + hidden_game_id + ".json");
//    file_text_write_string(file, json_string);
//    file_text_close(file);
//}

// Function: load_game_state
function load_game_state() {
    var filename = "hidden_game_" + hidden_game_id + ".json";
    
    if (file_exists(filename)) {
        var file = file_text_open_read(filename);
        var json_string = file_text_read_string(file);
        file_text_close(file);
        
        var save_data = json_parse(json_string);
        
        // Apply saved states
        for (var i = 0; i < array_length(save_data.objects); i++) {
            var saved_obj = save_data.objects[i];
            
            // Find matching object in hidden_objects array
            for (var j = 0; j < array_length(hidden_objects); j++) {
                if (hidden_objects[j].id == saved_obj.id) {
                    hidden_objects[j].found = saved_obj.found;
                    break;
                }
            }
        }
    }
}

// Initialize function - call this after hidden_game_id is set
function initialize_game() {
    show_debug_message("HIDDEN GAME ID BELOW");
    show_debug_message(hidden_game_id);
    
    switch(hidden_game_id) {
        case "table_game":
            // Add hidden objects with their positions and states
            show_debug_message("Table Game ID: Pushing objects");
			if (global.completed_table_game) {
				// Don't add objects if game already completed
				break;
			}
            array_push(hidden_objects, {
                sprite: spr_badge,
                x: background_x + 100,
                y: background_y + 440,
                width: sprite_get_width(spr_badge),
                height: sprite_get_height(spr_badge),
                found: false,
                id: "badge",
				is_item: true
            });
            
            array_push(hidden_objects, {
                sprite: spr_notepad,
                x: background_x + 350,
                y: background_y + 325,
                width: sprite_get_width(spr_notepad),
                height: sprite_get_height(spr_notepad),
                found: false,
                id: "notepad",
				is_item: true
            });
            break;
    }
    
    // Load saved states after objects are created
    //load_game_state();
}

// Add this function in your obj_hidden_object_game
function reset_game_state() {
    // Reset all objects to not found
    for (var i = 0; i < array_length(hidden_objects); i++) {
        hidden_objects[i].found = false;
    }
    
    // Delete the save file
    var filename = "hidden_game_" + hidden_game_id + ".json";
    if (file_exists(filename)) {
        file_delete(filename);
    }
    
    show_debug_message("Game state reset!");
}