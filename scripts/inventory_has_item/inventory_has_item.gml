// Esta função verifica se um item com uma certa CHAVE já está no inventário
function inventory_has_item(_item_key) {
	
	// Percorre cada item no inventário
	for (var i = 0; i < array_length(obj_item_manager.inv); i++) {
		
		// Pega a struct do item atual no inventário
		var item_no_inventario = obj_item_manager.inv[i];
		
		// Se a struct não tiver a propriedade 'name', algo está errado, então pulamos
		if (!is_struct(item_no_inventario)) continue;
		
		// Compara os nomes. Se forem iguais, o item já existe!
        // Nota: Isso assume que cada item tem um nome único.
		if (item_no_inventario.name == global.item_list[$ _item_key].name) {
			return true; // Encontrou! Retorna verdadeiro.
		}
	}
	
	return false; // Não encontrou o item no loop. Retorna falso.
}