// Base das cutscenes. Filhos: event_inherited(), definir `cutscene` (lista de
// [função, argumentos...] de scr_cutscene_functions) e `can_start`.
cutscene = [];
action = 0;
timer = 0;

// Quando a cutscene pode começar/continuar (ela também pausa durante diálogos)
can_start = function() {
	return true;
};
