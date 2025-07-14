// Draw the base sprite
draw_self();

// Draw interaction indicator
if (can_interact) {
    draw_set_color(c_blue);
    draw_text(x, y - 40, "Press E to examine");
    draw_set_color(c_white);
}