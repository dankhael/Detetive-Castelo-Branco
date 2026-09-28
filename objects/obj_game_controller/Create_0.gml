// Persistente e presente em mais de uma room: mantém só a primeira instância
if (instance_number(object_index) > 1) {
	instance_destroy();
	exit;
}

// Estado global
global.current_return_room = -1;
global.player_spawn_x = 0;
global.player_spawn_y = 0;
global.game_start = true;
global.dialogo = false;
global.on_cutscene = false;
global.on_inventory = false;
global.in_hidden_object_game = false;

// Game events
global.completed_table_game = false;
global.belo_event_1 = false;
global.patricia_event_1 = false;
global.cutscene_1_start = false;
global.completed_crime_game = false;
global.fraga_event_1 = false;
global.nicole_event_1 = false;
global.completed_vini_house_game = false;
global.cafeteria_unlocked = false;
global.pedro_event_1 = false;
global.pedro_event_success = false;
global.call_event_1 = false;
global.completed_safe_game = false;
global.julia_event_1 = false;
global.finished_puzzle_1 = false;
global.give_magazine = false;
global.julia_quiz = false;
global.gabriel_event_1 = false;
global.received_photo = false;
global.received_audio = false;
global.cafe_locker = false;
global.open_locker = false;
global.case_solved = false;
global.case_finished = false;
global.game_over = false;
global.tomas_event_success = false;
global.password_unlocked = false;

// Dados
scr_init_items();
scr_init_speakers();
scr_init_hidden_object_games();
scr_init_map_locations();
