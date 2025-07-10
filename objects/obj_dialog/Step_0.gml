if inicializar == false {
	ScriptTextos();
	inicializar = true;
}

if mouse_check_button_pressed(mb_left) or keyboard_check_pressed(ord("E")) {
    if pagina < ds_grid_height(texto_grid) - 1 {
        pagina++;
    } else {
        global.dialogo = false;
        // Tell the player when this dialog ended
        with(obj_player) {
            dialog_end_frame = current_time;
        }
        instance_destroy();
    }
}