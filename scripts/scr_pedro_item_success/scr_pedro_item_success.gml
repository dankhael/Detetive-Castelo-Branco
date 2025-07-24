function scr_pedro_item_success(){
	create_textbox("event 30");
	global.pedro_event_success = true;
	remove_item("bets");
	add_item("pendrive");
}