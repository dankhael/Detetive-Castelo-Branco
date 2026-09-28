if (!is_active()) exit;

other.y += push_y;
if (!global.dialogo) {
	create_textbox(text_id);
}
