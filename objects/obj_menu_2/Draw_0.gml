// Draw the menu options
draw_set_font(fnt_menu); // Optional: set your menu font
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
// Draw "Start"
draw_sprite_ext(spr_logo, 0, 1024, 0, 0.5, 0.5, 0, c_white, 1);
draw_set_color(c_white);
draw_text(1080, room_height/2 - 20, "Press ENTER to START");

global.in_hidden_object_game = false;
