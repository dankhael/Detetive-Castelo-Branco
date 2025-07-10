function ScriptTextos(){
	switch npc_nome{
		case "Evento Inicial":
			ds_grid_add_text("Droga, dormi demais, tenho que correr pra delegacia", spr_castelo_atrasado_portrait, 0, "Castelo");
			ds_grid_add_text("Não posso esquecer do meu bloco de anotações e do distintivo!", spr_castelo_normal_portrait, 0, "Castelo");
			ds_grid_add_text("Acho que deixei eles na mesa...", spr_castelo_tedio_portrait, 0, "Castelo");
		case "Itens Achados":
			ds_grid_add_text("Tá, agora tenho que ir pra delegacia", spr_castelo_atrasado_portrait, 0, "Castelo");
		break;
	}
}

function ds_grid_add_row() {
	///@arg ds_grid
	
	var _grid = argument[0];
	ds_grid_resize(_grid, ds_grid_width(_grid), ds_grid_height(_grid) + 1);
	return(ds_grid_height(_grid) - 1);
}

function ds_grid_add_text() {
	///@arg text
	///@arg retrato
	///@arg lado
	
	var _grid = texto_grid;
	var _y = ds_grid_add_row(_grid);
	
	_grid[# 0, _y] = argument[0];
	_grid[# 1, _y] = argument[1];
	_grid[# 2, _y] = argument[2];
	_grid[# 3, _y] = argument[3];
}