can_interact = instance_exists(obj_player) and distance_to_object(obj_player) <= interaction_distance;

if (can_interact and keyboard_check_pressed(ord("E")) and player_is_free()) {
	on_interact();
}
