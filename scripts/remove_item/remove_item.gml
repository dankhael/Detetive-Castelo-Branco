/// Remove um item do inventário, se ele estiver lá
/// @param item_key
function remove_item(_item_key) {
	var _index = array_get_index(obj_item_manager.inv, global.item_list[$ _item_key]);
	
	if (_index == -1) {
		show_debug_message("ERRO: tentativa de remover item que não está no inventário: " + string(_item_key));
		return;
	}
	
	array_delete(obj_item_manager.inv, _index, 1);
	show_debug_message("Item '" + _item_key + "' foi removido do inventário.");
}
