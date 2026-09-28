// Bloqueio invisível: enquanto is_active() for verdadeiro, empurra o jogador
// de volta (push_y) e mostra o diálogo text_id.
// Filhos: event_inherited() e sobrescrever text_id, push_y e is_active.
text_id = "";
push_y = 3;

is_active = function() {
	return true;
};
