function map_location(_room, _name, _spawn_x, _spawn_y, _unlocked = false) {
	return {
		target_room: _room,
		name: _name,
		spawn_x: _spawn_x,
		spawn_y: _spawn_y,
		unlocked: _unlocked,
	};
}

/// Locais do menu de mapa. Os bloqueados são liberados com scr_unlock_location.
function scr_init_map_locations() {
	global.map_locations = [
		map_location(rm_quarto,               "Casa do Castelo",      384, 457,  true),
		map_location(rm_delegacia_escritorio, "Delegacia",            86,  320,  true),
		map_location(rm_parque_casa_fraca,    "Parque Casa Fraca",    300, 1150),
		map_location(rm_casa_vinicius,        "Casa de Vinicius",     400, 482),
		map_location(rm_casa_de_orfeu,        "Casa de Orfeu",        395, 850),
		map_location(rm_cafeteria,            "Cafeteria Noite Azul", 400, 482),
		map_location(rm_metro,                "Metro",                400, 482),
	];
}
