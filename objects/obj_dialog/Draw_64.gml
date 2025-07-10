if inicializar == true {
	var _guix = display_get_gui_width();
	var _guiy = display_get_gui_height();

	var _xx = 0;
	var _yy = _guiy - 160;
	var _c = c_black;
	var _sprite = texto_grid[# Infos.Retrato, pagina];

	draw_set_font(fnt_dialogo);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);



	if texto_grid[# Infos.Lado, pagina] == 0{
		// Draw black box
		draw_rectangle_color(_xx + 200, _yy, _guix, _guiy, _c, _c, _c, _c, false);
		// Draw Name
		draw_text(_xx + 48, _yy - 72, texto_grid[# Infos.Nome, pagina]);
		// Draw text with consistent margins
		draw_text_ext(_xx + 264, _yy + 32, texto_grid[# Infos.Texto, pagina], -1, _guix - 264);
	
		draw_sprite_ext(_sprite, 0 , 100, _guiy, 3, 3, 0, c_white, 1);
	} else {
		// Draw black box
		draw_rectangle_color(_xx, _yy, _guix - 200, _guiy, _c, _c, _c, _c, false);
		var _stgw = string_width(texto_grid[# Infos.Nome, pagina]);
		// Draw Name
		draw_text(_guix - 48 - _stgw, _yy - 72, texto_grid[# Infos.Nome, pagina]);
		// Draw text with consistent margins
		draw_text_ext(_xx + 64, _yy + 32, texto_grid[# Infos.Texto, pagina], -1, _guix - 264);
	
		draw_sprite_ext(_sprite, 0 , _guix - 100, _guiy, -3, 3, 0, c_white, 1);
	}
}


