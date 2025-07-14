accept_key = keyboard_check_pressed(ord("E"));

textbox_x = camera_get_view_x(view_camera[0]) + 300;
textbox_y = camera_get_view_y(view_camera[0]) + 520;
speaker_x = camera_get_view_x(view_camera[0]) + 50;

//setup
if (setup == false) {
	setup = true;
	draw_set_font(fnt_dialogo_2);
	draw_set_color(c_white);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	//loop through the pages
	for(var p = 0; p < page_number; p++) {
		//find how many characters on each page and store that number in the "text_length" array
		text_length[p] = string_length(text[p]);
		
		//get the x position for the textbox
		text_x_offset[p] = 44; // No character textbox	
		//char on the left
		portrait_x_offset[p] = 4;
		
		//char on the right
		if (speaker_side[p] == -1) {
			portrait_x_offset[p] = 50;
		}
		
	}
}

//typing the text
if (draw_char < text_length[page]) {
	draw_char += text_spd;
	draw_char = clamp(draw_char, 0, text_length[page]);
}


//flip through pages
if (accept_key) {
	//if the typing is done
	if (draw_char == text_length[page]) {
		//next page
		if (page < page_number - 1) {
			page++;
			draw_char = 0;
		} else { //destroy textbox
			//link text for options
			if (option_number > 0) {
				create_textbox(option_link_id[option_pos]);				
			}
			global.dialogo = false;
			instance_destroy();
		}
	} else { //if not done typing
		draw_char = text_length[page];
	}
}


//draw the textbox
var _txtb_x = textbox_x + text_x_offset[page];
var _txtb_y =  textbox_y
txtb_img += txt_imb_spd;
txtb_spr_w = sprite_get_width(txtb_spr);
txtb_spr_h = sprite_get_height(txtb_spr);

//draw the speaker
if (speaker_sprite[page] != noone) {
    sprite_index = speaker_sprite[page];
    var _speaker_x;
    
    if (speaker_side[page] == -1) {
        // Position on the right side of the textbox
        _speaker_x = textbox_x + textbox_width;
    } else {
        // Position on the left side
        _speaker_x = textbox_x - 100;
    }
    
    //portrait background
    draw_sprite_ext(txtb_spr, txtb_img, _speaker_x, textbox_y, 4, textbox_height/txtb_spr_h, 0, c_white, 1);
    //portrait image - flip only the sprite when on right side
	var portrait_x = _speaker_x + 35;
	if (speaker_side[page] == -1) {
		portrait_x += 120
	}
    draw_sprite_ext(sprite_index, image_index, 
        portrait_x, 
        textbox_y + 30, 
        0.1 * (speaker_side[page] == -1 ? -1 : 1), 
        0.1, 
        0, 
        c_white, 
        1
    );
}

//back of the textbox
draw_sprite_ext(txtb_spr, txtb_img, _txtb_x, _txtb_y, textbox_width/txtb_spr_w, textbox_height/txtb_spr_h, 0, c_white, 1);

//options
if (draw_char == text_length[page] && page == page_number -1) {
	///option seletion
	option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	option_pos = clamp(option_pos, 0, option_number - 1);
	
	///draw the options
	var _op_space = 30;
	var _op_bord = 16;
	for (var op = 0; op < option_number; op++) {
		//the option box
		var _o_w = string_width(option[op]) + _op_bord * 2;
		draw_sprite_ext(txtb_spr, txtb_img, _txtb_x + 16, (_txtb_y - 8) - (_op_space * option_number) + (_op_space * op), _o_w/txtb_spr_w, (_op_space + 24)/txtb_spr_h, 0, c_white, 1);
		
		//the arrow
		if (option_pos == op) {
			draw_sprite(spr_textbox_arrow, 0, _txtb_x + 8, (_txtb_y + 8) - (_op_space * option_number) + (_op_space * op));
		}
		
		//the option text
		draw_text(_txtb_x + 16 + _op_bord, _txtb_y - _op_space * option_number + _op_space * op + 8, option[op]);
		
	}
}

//draw the text
var _drawtext = string_copy(text[page], 1, draw_char);
draw_text_ext(textbox_x + text_x_offset[page] + border, textbox_y + border, _drawtext, line_sep, line_width);