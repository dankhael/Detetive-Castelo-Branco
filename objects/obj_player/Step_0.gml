// --- INPUT ---
hsp = 0;
vsp = 0;

if (global.dialogo == false and obj_item_manager.visible_inventory == false) {
	if (keyboard_check(vk_right)) {
	    hsp = move_speed;
	    direction_facing = "right";
	} else if (keyboard_check(vk_left)) {
	    hsp = -move_speed;
	    direction_facing = "left";
	}

	if (keyboard_check(vk_up)) {
	    vsp = -move_speed;
	    direction_facing = "up";
	} else if (keyboard_check(vk_down)) {
	    vsp = move_speed;
	    direction_facing = "down";
	}
}

// --- COLLISION CHECK ---
// Horizontal collision
if (place_meeting(x + hsp, y, obj_wall)) {
    hsp = 0;
}

// Vertical collision
if (place_meeting(x, y + vsp, obj_wall)) {
    vsp = 0;
}

// Apply movement
x += hsp;
y += vsp;

// --- ANIMATE ---
if (hsp != 0 || vsp != 0) {
    image_speed = 0.2;
} else {
    image_speed = 0;
    image_index = 0;
}

// --- SWITCH SPRITE ---
switch (direction_facing) {
    case "down":
        sprite_index = spr_player_walk_down;
        break;
    case "up":
        sprite_index = spr_player_walk_up;
        break;
    case "left":
        sprite_index = spr_player_walk_left;
        break;
    case "right":
        sprite_index = spr_player_walk_right;
        break;
}

if (distance_to_object(obj_par_npcs) <= 10) {
    if keyboard_check_pressed(ord("E")) and global.dialogo == false and dialog_end_frame != current_time {
        var npc = instance_nearest(x, y, obj_par_npcs);
        var dialogo = instance_create_layer(x, y, "Dialogo", obj_dialog);
        dialogo.npc_nome = npc.nome;
        global.dialogo = true;
    }
}
