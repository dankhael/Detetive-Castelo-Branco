if (!visible_inventory) exit; // Don't draw unless inventory is open

// === CONFIGURATION ===
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

var start_x = 64;
var start_y = 32;
var box_w = 512;
var padding = 16;
var line_spacing = 32;
var text_width = box_w - padding * 3 - 64; // leave space for sprite

// === BACKGROUND ===
draw_set_color(c_black);
draw_set_alpha(0.75);
draw_rectangle(start_x, start_y, start_x + box_w, gui_h - start_y, false);
draw_set_alpha(1);

// === TITLE ===
draw_set_color(c_white);
draw_set_font(fnt_dialogo); // optional: set your custom font
draw_text(start_x + padding, start_y + padding - 8, "Inventory");


// === DRAW ITEMS ===
var yy = start_y + 48;
var items_to_show = array_length(inv);

for (var i = 0; i < items_to_show; i++) {
	var item = obj_item_manager.inv[i];

    var spr = item.sprite;
    var name = item.name;
    var desc = item.description;
	
	 // === BACKGROUND BOX ===
    var desc_lines = ceil(string_width(desc) / text_width); // crude estimate
    var box_h = 32 + line_spacing * max(2, desc_lines); // name + 1+ lines desc

    // Draw item background
    draw_set_color(c_gray);
    draw_rectangle(start_x + padding - 8, yy - 8, start_x + box_w - padding, yy + box_h - 8, false);

    // Draw item sprite
    if (sprite_exists(spr)) {
        draw_sprite(spr, 0, start_x + padding, yy + 64);
    }


    // === DRAW TEXT ===
    var tx = start_x + padding + 64; // text starts to the right of sprite
    var ty = yy + 8;

    draw_set_color(c_white);
    draw_text(tx, ty, name); // item name
    draw_text_ext(tx, ty + 24, desc, -1, text_width); // wrapped description

    yy += box_h + 8;
}
