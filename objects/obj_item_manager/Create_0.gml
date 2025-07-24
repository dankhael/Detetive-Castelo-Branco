depth = -9999;

item_selected = 0;

selected_items = []; // Array to track selected items
selection_mode = false; // Are we in selection mode?

function create_item(_name, _desc, _spr) constructor {
	name = _name;
	description = _desc;
	sprite = _spr;
}


//create the items
global.item_list = {
	badge : new create_item(
		"Distintivo",
		"Meu distintivo de policial, ninguém ia acreditar que eu sou um detetive se eu não o levasse comigo.",
		spr_badge
	),
	notepad : new create_item(
		"Caderno",
		"Esse bloco de notas já me ajudou muito, as pessoas subestimam o quão util é anotar seus pensamentos.",
		spr_notepad
	),
	magazine : new create_item(
		"Revista Choquetel",
		"A Choquetel sempre faz as melhores revistas de quebra cabeça, fico horas jogando sudoku.",
		spr_magazine
	),
	magnet : new create_item(
		"Imã de Neodimio",
		"Um imã de neodimio que eu encontrei na cena do crime, muito util em certas situações...",
		spr_magnet
	),
	bets : new create_item(
		"Apostas Esportivas",
		"Um papel com dicas de apostas esportivas, será que é uma sinal pra eu apostar?",
		spr_bets
	),
	nota : new create_item(
		"Nota fiscal",
		"Nota fiscal de uma roupa de palhaço, bem esquisito...",
		spr_nota
	),
	pendrive : new create_item(
		"Pen Drive",
		"Pen drive com alguns arquivos criptografados e uma chave desenhada, oque a vitima estava escondendo?",
		spr_pendrive
	),
	clipe : new create_item(
		"Clipe de Papel",
		"Quem guarda um clipe de papel em um cofre? É melhor ficar com ele de qualquer forma",
		spr_clipe
	),
	bilhete : new create_item(
		"Bilhete",
		"1337... oque será que significa? seria um código pra algo?",
		spr_bilhete
	),
	photo : new create_item(
		"Foto Secreta",
		"Tomás e Vinicius se encontrando recentemente? e que lugar é esse?",
		spr_photo
	),
	key : new create_item(
		"Chave de armário",
		"Chave escondida dentro do armário",
		spr_key
	),
	mensagem : new create_item(
		"Mensagem Oculta",
		"'Um rei sempre protege sua rainha', esse cara sempre se comunicava por codigos?",
		spr_mensagem
	),
	decodex : new create_item(
		"DecodeX",
		"Então ele existe mesmo?! Vinicius perdeu sua vida por causa desse dispositivo...",
		spr_decodex
	),
	notebook : new create_item(
		"Notebook",
		"Sinto que esse notebook contém uma prova vital",
		spr_notebook
	),
	audio : new create_item(
		"Audio Secreto",
		"Um audio revelador sobre a situação de vinicius, a outra pessoa no aúdio foi quem o matou!",
		spr_audio
	),
	
}

//create the inventory
inv = array_create(0);

visible_inventory = false;

// Function to start item selection
function start_item_selection(_required_items, _max_items, _prompt, _success_callback, _fail_callback) {
    global.selection_active = true;
    global.selection_required_items = _required_items;
    global.selection_max_items = _max_items;
    global.selection_prompt = _prompt;
    global.selection_callback_success = _success_callback;
    global.selection_callback_fail = _fail_callback;
    
    selection_mode = true;
    visible_inventory = true;
    selected_items = [];
    item_selected = 0;
}

// Function to check if selection is correct
function check_selection_correct() {
    if (array_length(selected_items) != array_length(global.selection_required_items)) {
        return false;
    }
    
    // Check if all required items are in the selection
    for (var i = 0; i < array_length(global.selection_required_items); i++) {
        var required_key = global.selection_required_items[i];
        var found = false;
        
        for (var j = 0; j < array_length(selected_items); j++) {
            // Get the key from the selected item
            var selected_key = get_item_key_from_object(selected_items[j]);
            if (selected_key == required_key) {
                found = true;
                break;
            }
        }
        
        if (!found) return false;
    }
    
    return true;
}

// Helper function to get item key from item object
function get_item_key_from_object(_item_obj) {
    var struct_names = variable_struct_get_names(global.item_list);
    for (var i = 0; i < array_length(struct_names); i++) {
        var key = struct_names[i];
        var item = variable_struct_get(global.item_list, key);
        if (item == _item_obj) {
            return key;
        }
    }
    return "";
}

// Function to finish selection
function finish_selection() {
    var success = check_selection_correct();
    
    // Reset selection state
    global.selection_active = false;
    selection_mode = false;
    visible_inventory = false;
    selected_items = [];
    
    // Call appropriate callback
    if (success) {
        script_execute(global.selection_callback_success);
    } else if (!success) {
        script_execute(global.selection_callback_fail);
    }
}

// Add these password variables to your existing Create_0.gml
password_mode = false;
password_input = "";
password_cursor_blink = 0;

// Function to start password entry
function start_password_entry(_correct_password, _prompt, _success_callback, _fail_callback, _max_length = 4) {
    global.password_active = true;
    global.password_correct = _correct_password;
    global.password_prompt = _prompt;
    global.password_callback_success = _success_callback;
    global.password_callback_fail = _fail_callback;
    global.password_max_length = _max_length;
    
    password_mode = true;
    visible_inventory = true; // Reuse your inventory display system
    password_input = "";
    password_cursor_blink = 0;
}

// Function to check password
function check_password() {
    var success = (password_input == global.password_correct);
    
    // Reset password state
    global.password_active = false;
    password_mode = false;
    visible_inventory = false;
    password_input = "";
    
    // Call appropriate callback
    if (success) {
        script_execute(global.password_callback_success);
    } else if (!success) {
        script_execute(global.password_callback_fail);
    }
}
