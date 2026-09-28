/// @param item_key
function inventory_has_item(_item_key) {
	var _item = global.item_list[$ _item_key];
	return _item != undefined and array_contains(obj_item_manager.inv, _item);
}
