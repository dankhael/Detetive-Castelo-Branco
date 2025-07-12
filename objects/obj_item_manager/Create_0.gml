depth = -9999;

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
	)
}

//create the inventory
inv = array_create(0);

item_selected = -1;
visible_inventory = false;
