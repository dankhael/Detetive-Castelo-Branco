/// Adiciona um item de global.item_list ao inventário (ignora se já estiver lá)
/// @param item_key
function add_item(_item_key) {
	var _item = global.item_list[$ _item_key];
	
	if (_item == undefined) {
		show_debug_message("ERRO: item inexistente: " + string(_item_key));
		return;
	}
	
	if (inventory_has_item(_item_key)) return;
	
	array_push(obj_item_manager.inv, _item);
	show_debug_message("Item '" + _item.name + "' foi adicionado ao inventário.");
}
