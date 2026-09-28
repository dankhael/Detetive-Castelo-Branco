/// @param room
function scr_unlock_location(_room) {
	for (var i = 0; i < array_length(global.map_locations); i++) {
		var _location = global.map_locations[i];
		if (_location.target_room == _room) {
			_location.unlocked = true;
			return true;
		}
	}
	return false;
}
