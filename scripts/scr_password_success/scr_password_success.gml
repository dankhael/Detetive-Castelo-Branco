function scr_password_success(){
	show_debug_message("Password successful!");
	global.password_unlocked = true;
	create_textbox("event 58");
}