// Draw the menu options
draw_set_font(fnt_menu); // Optional: set your menu font
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
// Draw "Start"
draw_text(room_width/2, room_height/2 - 20, "Press ENTER to START");

// Draw "Exit"
draw_text(room_width/2, room_height/2 + 20, "Press ESC to EXIT");

global.in_hidden_object_game = false;
