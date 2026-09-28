// Persistente e presente em mais de uma room: mantém só a primeira instância
if (instance_number(object_index) > 1) {
	instance_destroy();
	exit;
}

depth = -9999;

// Inventário (structs de global.item_list, ver scr_game_data)
inv = [];
item_selected = 0;
visible_inventory = false;

// === MODO SELEÇÃO: o jogador escolhe itens para resolver algo ===
selection_mode = false;
selected_items = [];
selection = {
	required: [],       // chaves dos itens corretos
	max_items: 1,
	prompt: "",
	on_success: undefined,
	on_fail: undefined,
};

// === MODO SENHA: teclado numérico ===
password_mode = false;
password_input = "";
password_cursor_blink = 0;
password = {
	correct: "",
	prompt: "",
	max_length: 4,
	on_success: undefined,
	on_fail: undefined,
};

/// Abre o inventário para o jogador escolher itens; chama _on_success/_on_fail ao confirmar
function start_item_selection(_required_items, _max_items, _prompt, _on_success, _on_fail) {
	selection.required = _required_items;
	selection.max_items = _max_items;
	selection.prompt = _prompt;
	selection.on_success = _on_success;
	selection.on_fail = _on_fail;
	
	selection_mode = true;
	visible_inventory = true;
	selected_items = [];
	item_selected = 0;
}

function check_selection_correct() {
	if (array_length(selected_items) != array_length(selection.required)) return false;
	
	for (var i = 0; i < array_length(selected_items); i++) {
		if (!array_contains(selection.required, selected_items[i].key)) return false;
	}
	return true;
}

function toggle_selected_item(_item) {
	var _index = array_get_index(selected_items, _item);
	if (_index != -1) {
		array_delete(selected_items, _index, 1);
	} else if (array_length(selected_items) < selection.max_items) {
		array_push(selected_items, _item);
	}
}

function finish_selection() {
	var _success = check_selection_correct();
	close_inventory();
	
	if (_success) selection.on_success();
	else selection.on_fail();
}

/// Abre o teclado de senha; chama _on_success/_on_fail ao confirmar
function start_password_entry(_correct_password, _prompt, _on_success, _on_fail, _max_length = 4) {
	password.correct = _correct_password;
	password.prompt = _prompt;
	password.on_success = _on_success;
	password.on_fail = _on_fail;
	password.max_length = _max_length;
	
	password_mode = true;
	visible_inventory = true;
	password_input = "";
	password_cursor_blink = 0;
}

function check_password() {
	var _success = (password_input == password.correct);
	close_inventory();
	
	if (_success) password.on_success();
	else password.on_fail();
}

/// Fecha o inventário e cancela qualquer modo especial
function close_inventory() {
	visible_inventory = false;
	selection_mode = false;
	selected_items = [];
	password_mode = false;
	password_input = "";
}
