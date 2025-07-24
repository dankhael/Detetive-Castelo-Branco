if (!visible_inventory) exit;

// If in password mode, draw password screen instead
if (password_mode) {
    // === PASSWORD SCREEN ===
    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();
    
    // Center panel
    var panel_w = 400;
    var panel_h = 300;
    var panel_x = (gui_w - panel_w) / 2;
    var panel_y = (gui_h - panel_h) / 2;
    var padding = 32;
    
    // Background
    draw_set_color(c_black);
    draw_set_alpha(0.85);
    draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, false);
    draw_set_alpha(1);
    
    // Border
    draw_set_color(c_white);
    draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, true);
    
    // Title
    draw_set_font(fnt_dialogo);
    draw_set_color(c_yellow);
    var title_x = panel_x + padding;
    var title_y = panel_y + padding;
    draw_text(title_x, title_y, global.password_prompt);
    
    // Password input box
    var input_x = panel_x + padding;
    var input_y = title_y + 60;
    var input_w = panel_w - (padding * 2);
    var input_h = 60;
    
    // Input box background
    draw_set_color(c_dkgray);
    draw_rectangle(input_x, input_y, input_x + input_w, input_y + input_h, false);
    draw_set_color(c_white);
    draw_rectangle(input_x, input_y, input_x + input_w, input_y + input_h, true);
    
    // Password text (with asterisks for security)
    draw_set_color(c_white);
    var display_text = "";
    for (var i = 0; i < string_length(password_input); i++) {
        display_text += "*";
    }
    
    // Add blinking cursor
    if (password_cursor_blink % 60 < 30) {
        display_text += "_";
    }
    
    // Center the text in the input box
    var text_x = input_x + (input_w / 2) - (string_width(display_text) / 2);
    var text_y = input_y + (input_h / 2) - (string_height(display_text) / 2);
    draw_text(text_x, text_y, display_text);
    
    // Progress indicator
    draw_set_color(c_gray);
    var progress_text = string(string_length(password_input)) + "/" + string(global.password_max_length);
    draw_text(input_x + input_w - string_width(progress_text), input_y - 25, progress_text);
    
    // Instructions
    draw_set_color(c_ltgray);
    var instr_y = input_y + input_h + 30;
    draw_text(input_x, instr_y, "Use number keys (0-9) to enter code");
    draw_text(input_x, instr_y + 25, "BACKSPACE: Delete  |  ENTER: Confirm  |  ESC: Cancel");
    
    // Visual keypad (optional - shows available numbers)
    draw_set_color(c_white);
    var keypad_y = instr_y + 70;
    var key_size = 30;
    var key_spacing = 35;
    var start_x = input_x + (input_w / 2) - (key_spacing * 4.5);
    
    for (var i = 0; i <= 9; i++) {
        var key_x = start_x + ((i % 5) * key_spacing);
        var key_y = keypad_y + (floor(i / 5) * key_spacing);
        
        draw_rectangle(key_x, key_y, key_x + key_size, key_y + key_size, true);
        var num_x = key_x + (key_size / 2) - (string_width(string(i)) / 2);
        var num_y = key_y + (key_size / 2) - (string_height(string(i)) / 2);
        draw_text(num_x, num_y, string(i));
    }
    
    exit; // Don't draw regular inventory
}

// === CONFIGURATION ===
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// Left panel (item list)
var list_x = 64;
var list_y = 32;
var list_w = 320;
var list_h = gui_h - 64;

// Right panel (item details)
var details_x = list_x + list_w + 32;
var details_w = 320;
var details_y = list_y;
var details_h = list_h;

var padding = 24;
var item_height = 48;

// === BACKGROUND ===
draw_set_color(c_black);
draw_set_alpha(0.75);
draw_rectangle(list_x, list_y, list_x + list_w, list_y + list_h, false);
draw_rectangle(details_x, details_y, details_x + details_w, details_y + details_h, false);
draw_set_alpha(1);

// === TITLES ===
draw_set_color(c_white);
draw_set_font(fnt_dialogo);

// Change title based on mode
var title_text = selection_mode ? "Select Items" : "Inventory";
draw_text(list_x + padding, list_y + padding - 8, title_text);
draw_text(details_x + padding, details_y + padding - 8, "Details");

// Show selection prompt if in selection mode
if (selection_mode) {
    draw_set_color(c_yellow);
    draw_text_ext(list_x + padding, list_y + padding + 16, global.selection_prompt + " (" + string(array_length(selected_items)) + "/" + string(global.selection_max_items) + ")", 20, list_w - padding*2);
}

// === DRAW ITEMS LIST ===
var items_to_show = array_length(inv);

// Handle selection input (only if not in selection mode for navigation)
if (!selection_mode) {
    if (keyboard_check_pressed(vk_up) && item_selected > 0) {
        item_selected--;
    }
    if (keyboard_check_pressed(vk_down) && item_selected < items_to_show - 1) {
        item_selected++;
    }
} else {
    // Selection mode navigation
    if (keyboard_check_pressed(vk_up) && item_selected > 0) {
        item_selected--;
    }
    if (keyboard_check_pressed(vk_down) && item_selected < items_to_show - 1) {
        item_selected++;
    }
}

// Draw items
for (var i = 0; i < items_to_show; i++) {
    var item = inv[i];
    var yy = list_y + (selection_mode ? 80 : 60) + (i * item_height);
    
    // Check if item is selected in selection mode
    var is_selected_for_use = false;
    if (selection_mode) {
        for (var j = 0; j < array_length(selected_items); j++) {
            if (selected_items[j] == item) {
                is_selected_for_use = true;
                break;
            }
        }
    }
    
    // Selected item highlight (navigation)
    if (i == item_selected) {
        draw_set_color(c_yellow);
        draw_set_alpha(0.3);
        draw_rectangle(list_x + padding, yy, list_x + list_w - padding, yy + item_height - 4, false);
        draw_set_alpha(1);
    }
    
    // Selected for use highlight (selection mode)
    if (is_selected_for_use) {
        draw_set_color(c_green);
        draw_set_alpha(0.4);
        draw_rectangle(list_x + padding, yy, list_x + list_w - padding, yy + item_height - 4, false);
        draw_set_alpha(1);
        
        // Draw checkmark
        draw_set_color(c_lime);
        draw_text(list_x + list_w - padding - 20, yy + item_height/3, "✓");
    }
    
    // Draw item sprite
    if (sprite_exists(item.sprite)) {
        draw_sprite_ext(item.sprite, 0, list_x + padding + 16, yy + item_height/2, 0.5, 0.5, 0, c_white, 1);
    }
    
    // Draw item name
    draw_set_color(c_white);
    draw_text(list_x + padding + 48, yy + item_height/3, item.name);
}

// === DRAW DETAILS PANEL ===
if (item_selected >= 0 && item_selected < items_to_show) {
    var selected_item = inv[item_selected];
    
    // Draw large sprite
    if (sprite_exists(selected_item.sprite)) {
        var sprite_scale = 2;
        var sprite_x = details_x + details_w/2;
        var sprite_y = details_y + padding + 128;
        draw_sprite_ext(selected_item.sprite, 0, sprite_x, sprite_y, sprite_scale, sprite_scale, 0, c_white, 1);
    }
    
    // Draw name and description
    draw_set_color(c_white);
    draw_text(details_x + padding, details_y + 256, selected_item.name);
    draw_text_ext(details_x + padding, details_y + 288, selected_item.description, 24, details_w - padding*2);
}

// === DRAW CONTROLS ===
if (selection_mode) {
    draw_set_color(c_white);
    var controls_y = gui_h - 80;
    draw_text(list_x + padding, controls_y, "SPACE/ENTER: Toggle Selection");
    draw_text(list_x + padding, controls_y + 20, "C: Confirm Selection");
    draw_text(list_x + padding, controls_y + 40, "ESC: Cancel");
}