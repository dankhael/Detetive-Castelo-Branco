// Abrir/fechar o inventário normal
if (keyboard_check_pressed(ord("I")) and !selection_mode and !password_mode
	and !global.dialogo and !global.on_cutscene and !global.in_hidden_object_game) {
	visible_inventory = !visible_inventory;
}

// Navegação na lista (inventário normal e modo seleção)
if (visible_inventory and !password_mode and !global.dialogo) {
	var _count = array_length(inv);
	item_selected += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	item_selected = clamp(item_selected, 0, max(0, _count - 1));
}

// Modo seleção
if (selection_mode and !global.dialogo) {
	if (keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter)) {
		if (item_selected < array_length(inv)) {
			toggle_selected_item(inv[item_selected]);
		}
	}
	
	if (keyboard_check_pressed(ord("C"))) {
		finish_selection();
	} else if (keyboard_check_pressed(vk_escape)) {
		close_inventory();
	}
}

// Modo senha
if (password_mode and !global.dialogo) {
	password_cursor_blink++;
	
	for (var i = 0; i <= 9; i++) {
		if (keyboard_check_pressed(ord(string(i))) and string_length(password_input) < password.max_length) {
			password_input += string(i);
		}
	}
	
	if (keyboard_check_pressed(vk_backspace)) {
		password_input = string_delete(password_input, string_length(password_input), 1);
	}
	
	if (keyboard_check_pressed(vk_enter) and string_length(password_input) > 0) {
		check_password();
	} else if (keyboard_check_pressed(vk_escape)) {
		close_inventory();
	}
}

global.on_inventory = visible_inventory;
