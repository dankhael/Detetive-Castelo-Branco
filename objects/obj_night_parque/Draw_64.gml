// obj_night_parque → Draw GUI Event
draw_set_alpha(0.5); // Transparency level — 0 is invisible, 1 is fully opaque
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1); // Reset alpha to avoid affecting other drawings
