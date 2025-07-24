global.map_locations = ds_list_create();
global.current_return_room = -1;
global.player_spawn_x = 0;
global.player_spawn_y = 0;
global.game_start = true;
global.on_cutscene = false;
global.on_inventory = false;

// Game events
global.completed_table_game = false;
global.belo_event_1 = false;
global.patricia_event_1 = false;
global.received_magazine = false;
global.cutscene_1_start = false;
global.completed_crime_game = false;
global.fraga_event_1 = false;
global.nicole_event_1 = false;
global.nicole_block = true;
global.orpheus_house_unlocked = false;
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
global.received_pendrive = false;
global.received_audio = false;
global.case_solved = false;
global.game_over = false;
global.tomas_event_success = false;
global.password_unlocked = false;
global.julia_quiz_completed = false;

// Selection screen variables
global.selection_active = false;
global.selection_required_items = []; // Array of required item keys
global.selection_max_items = 1; // How many items can be selected (1-3)
global.selection_callback_success = scr_selection_success; // Function to call on success
global.selection_callback_fail = scr_selection_fail; // Function to call on failure
global.selection_prompt = "Select the correct item:"; // Instruction text

// Password system variables
global.password_active = false;
global.password_correct = "1337"; // The correct password
global.password_callback_success = scr_password_success; // Function to call on success
global.password_callback_fail = scr_password_fail; // Function to call on failure
global.password_prompt = "Coloque a senha:"; // Instruction text
global.password_max_length = 4; // Maximum password length

scr_init_map_locations();