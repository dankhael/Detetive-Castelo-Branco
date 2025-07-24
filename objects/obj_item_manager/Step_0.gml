// Regular inventory toggle (only when not in selection mode)
if (keyboard_check_pressed(ord("I")) and !global.dialogo and !global.on_cutscene and !selection_mode and !password_mode) {
    visible_inventory = !visible_inventory;
	global.on_inventory = visible_inventory;
}

// Selection mode controls
if (selection_mode && visible_inventory && !global.dialogo) {
	global.on_inventory = visible_inventory;
    // Toggle item selection with SPACE or ENTER
    if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)) {
        if (item_selected >= 0 && item_selected < array_length(inv)) {
            var current_item = inv[item_selected];
            var already_selected = false;
            var selected_index = -1;
            
            // Check if item is already selected
            for (var i = 0; i < array_length(selected_items); i++) {
                if (selected_items[i] == current_item) {
                    already_selected = true;
                    selected_index = i;
                    break;
                }
            }
            
            if (already_selected) {
                // Remove from selection
                array_delete(selected_items, selected_index, 1);
            } else {
                // Add to selection (if not at max)
                if (array_length(selected_items) < global.selection_max_items) {
                    array_push(selected_items, current_item);
                }
            }
        }
    }
    
    // Confirm selection with C key
    if (keyboard_check_pressed(ord("C"))) {
        finish_selection();
    }
    
    // Cancel selection with ESC
    if (keyboard_check_pressed(vk_escape)) {
        global.selection_active = false;
        selection_mode = false;
        visible_inventory = false;
		global.on_inventory = visible_inventory;
        selected_items = [];
    }
}

// Password mode controls
if (password_mode && visible_inventory) {
    password_cursor_blink++;
    
    // Number input (0-9)
    for (var i = 0; i <= 9; i++) {
        if (keyboard_check_pressed(ord(string(i)))) {
            if (string_length(password_input) < global.password_max_length) {
                password_input += string(i);
            }
        }
    }
    
    // Backspace to delete
    if (keyboard_check_pressed(vk_backspace)) {
        if (string_length(password_input) > 0) {
            password_input = string_delete(password_input, string_length(password_input), 1);
        }
    }
    
    // Enter to confirm
    if (keyboard_check_pressed(vk_enter)) {
        if (string_length(password_input) > 0) {
            check_password();
        }
    }
    
    // Escape to cancel
    if (keyboard_check_pressed(vk_escape)) {
        global.password_active = false;
        password_mode = false;
        visible_inventory = false;
        password_input = "";
    }
}