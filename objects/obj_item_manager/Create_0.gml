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
}

//create the inventory
inv = array_create(0);

item_selected = -1;
visible_inventory = false;
