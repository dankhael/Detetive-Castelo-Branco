if (global.pedro_event_success and !global.dialogo and !global.call_event_1) {
	create_textbox(text_id);
	global.call_event_1 = true;
	instance_destroy();
}