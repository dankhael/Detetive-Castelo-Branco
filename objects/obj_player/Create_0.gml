// Create Event of obj_player

move_speed = 2;

// Hold the current direction: "up", "down", "left", "right"
direction_facing = "down";

// Set default sprite
sprite_index = spr_player_walk_down;

// Stop animation until moving
image_speed = 0;

dialog_end_frame = -1;

// Start initial dialog
var npc = instance_create_layer(x, y, "Instances_1", obj_start_event);
var dialogo = instance_create_layer(x, y, "Dialogo", obj_dialog);
dialogo.npc_nome = npc.nome;
global.dialogo = true;