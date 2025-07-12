function add_item(_item_key) {

	// PASSO 1: VERIFICAR SE A CHAVE É VÁLIDA E EXISTE NA LISTA GLOBAL
	// A função 'struct_exists' verifica se uma chave existe dentro de uma struct.
	if (!is_string(_item_key) || !struct_exists(global.item_list, _item_key)) {
		
		// Se a chave não for uma string ou não existir, mostre um erro e pare a função.
		show_debug_message("ERRO: Tentativa de adicionar um item com uma chave inválida ou inexistente: " + string(_item_key));
		return; // Sai da função para evitar o crash.
	}
	
	// Se o código chegou aqui, a chave é válida!
	var item_data_completo = global.item_list[$ _item_key];
	
	// Adiciona a STRUCT COMPLETA ao array do inventário
	array_push(obj_item_manager.inv, item_data_completo);
	
	// Esta linha agora é segura e não vai mais quebrar o jogo.
	show_debug_message("Item '" + item_data_completo.name + "' foi adicionado ao inventário.");
}