function scr_init_map_locations() {
    // Clear existing locations
    ds_list_clear(global.map_locations);
    
    // Add your rooms here - format: [room, name, spawn_x, spawn_y, unlocked]
    // Example locations (replace with your actual room names):
    
    var quarto = ds_map_create();
    ds_map_add(quarto, "room", rm_quarto);
    ds_map_add(quarto, "name", "Casa do Castelo");
    ds_map_add(quarto, "spawn_x", 384);
    ds_map_add(quarto, "spawn_y", 457);
    ds_map_add(quarto, "unlocked", true);
    ds_list_add(global.map_locations, quarto);
    
    var delegacia = ds_map_create();
    ds_map_add(delegacia, "room", rm_delegacia_escritorio);
    ds_map_add(delegacia, "name", "Delegacia");
    ds_map_add(delegacia, "spawn_x", 86);
    ds_map_add(delegacia, "spawn_y", 320);
    ds_map_add(delegacia, "unlocked", true);
    ds_list_add(global.map_locations, delegacia);
    
    var parque = ds_map_create();
    ds_map_add(parque, "room", rm_parque_casa_fraca);
    ds_map_add(parque, "name", "Parque Casa Fraca");
    ds_map_add(parque, "spawn_x", 200);
    ds_map_add(parque, "spawn_y", 300);
    ds_map_add(parque, "unlocked", false); // Locked initially
    ds_list_add(global.map_locations, parque);
}