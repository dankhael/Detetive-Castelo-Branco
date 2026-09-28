// --- INPUT ---
hsp = 0;
vsp = 0;

move_speed = keyboard_check(vk_shift) ? 6 : 2;

if (player_is_free()) {
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
var _solids = [obj_wall, obj_npc_wall];
if (place_meeting(x + hsp, y, _solids)) {
    hsp = 0;
}
if (place_meeting(x, y + vsp, _solids)) {
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
