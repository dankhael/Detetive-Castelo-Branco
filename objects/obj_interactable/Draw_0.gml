draw_self();

if (show_prompt and can_interact) {
	draw_set_color(c_blue);
	draw_text(x, y - 40, "Press E to examine");
	draw_set_color(c_white);
}
