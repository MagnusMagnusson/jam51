draw_set_color(c_white);
draw_set_font(fnt_bog);
draw_sprite_ext(spr_logo, 0, display_get_gui_width() / 2, display_get_gui_height() * 0.05,.5,.5,0,c_white,1);


switch(menu_layer){
	case 0: {
		if(show_blink){
			draw_set_font(fnt_smaller);
			draw_set_halign(fa_center);
			draw_text(display_get_gui_width() / 2, display_get_gui_height() / 2, "Press 'Enter' to start");
			if(Input().controller){
				draw_text(display_get_gui_width() / 2, display_get_gui_height() / 2 + string_height("A"), "Controller detected: Press the 'A'/'X' button");
			} else{				
				draw_text(display_get_gui_width() / 2, display_get_gui_height() / 2 + string_height("A"), @"No controller detected, but is strongly recommended. 
Press 'start' to activate one.");
			}
			draw_set_halign(fa_left);
		}
		break;
	}
	case 1: {
		var longest = 0;
		for(var i = 0; i < array_length(option_text); i++){
			longest = max(string_width(option_text[i]), longest);
		}

		draw_set_font(fnt_bog);
		draw_set_halign(fa_center);

		for(var i = 0; i < array_length(option_text); i++){
			var x0 = display_get_gui_width() / 2 - longest/2 - 16;
			var x1 = display_get_gui_width() / 2 + longest/2 + 16;
			var y0 = (i*(32+string_height("A"))) + display_get_gui_height() / 2;
			var y1 = (i*(32+string_height("A"))) + string_height("A")  + display_get_gui_height() /  2;
	
			draw_set_alpha(i == selected ? 1 : 0.8);
			draw_set_color(i == selected ? #f2f1d6 :#88882d );
			draw_roundrect(x0,y0, x1, y1, false);
			draw_set_color(c_black)
			draw_text((x0 + x1) / 2, y0, option_text[i]);
		}

		draw_set_alpha(1);
		draw_set_halign(fa_left);
		draw_set_font(fnt_smaller);
		break;
	}
}


