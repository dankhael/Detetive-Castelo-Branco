// --- INPUT ---
hsp = 0;
vsp = 0;

if (keyboard_check(vk_shift)) {
	move_speed = 6;
} else {
	move_speed = 2;
}

if (!global.dialogo and !obj_item_manager.visible_inventory and !global.on_cutscene and !global.in_hidden_object_game) {
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
if (place_meeting(x + hsp, y, obj_wall) or place_meeting(x + hsp, y, obj_npc_wall)) {
    hsp = 0;
}

// Vertical collision
if (place_meeting(x, y + vsp, obj_wall) or place_meeting(x, y + vsp, obj_npc_wall)) {
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
