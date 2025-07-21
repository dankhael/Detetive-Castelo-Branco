if (global.cutscene_1_start and !global.dialogo) {
	global.on_cutscene = true;
	var _current_action = cutscene[action];
	//show_debug_message("Cutscene Array: " + string(cutscene));
	var _action_args = array_length(_current_action) - 1;
	//show_debug_message("Action Args: " + string(_action_args));
	show_debug_message("Action Number: " + string(action));
	show_debug_message("Current Action: " + script_get_name(_current_action[0]));
	switch(_action_args) {
		case 0:
			script_execute(_current_action[0]);
			break;
		case 1:
			script_execute(_current_action[0], _current_action[1]);
			break;
		case 2:
			script_execute(_current_action[0], _current_action[1], _current_action[2]);
			break;
		case 3:
			script_execute(_current_action[0], _current_action[1], _current_action[2], _current_action[3]);
			break;
	}
}



