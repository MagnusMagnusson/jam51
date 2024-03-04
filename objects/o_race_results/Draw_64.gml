draw_set_alpha(0.5);
draw_set_color(c_black);
for(var i = 0; i < 20; i++){
	var x0 = 0;
	var x1 = display_get_gui_width();
	var y0 = (display_get_height() / 20) * (i + 0.5) - (blindTimer * (display_get_height() / 20) / 2);
	var y1 = (display_get_height() / 20) * (i + 0.5) + (blindTimer * (display_get_height() / 20) / 2);
	draw_rectangle(x0, y0, x1, y1, false);
}
draw_set_alpha(1);

var ladder = ctrl.results;

draw_set_font(fnt_smaller);
var sw =  string_width("1. Raccoon Window Washing COrporation 23:00:00");
var sh =  string_height("1. Raccoon Window Washing COrporation 23:00:00");
for(var i = 0; i < array_length(ladder); i++){
	draw_set_color(c_white);
	var x0 = 0  + min(0,positionTimer - i -1) * sw;
	var x1 = sw + 16 + min(0,positionTimer - i-1) * sw;
	var y0 = sh * i + display_get_height() * 0.1;
	var y1 = 32 + (i + 1) * sh + display_get_height() * 0.1;
	draw_rectangle(x0, y0, x1, y1, false);
	draw_set_color(c_black);
	draw_text(8 + x0, y0 + 8, string("{0}. {1} : {2}", i + 1, ladder[i].name, time_stringtime(ladder[i].finalTime)));
}

for(var i = 0; i < buckets; i++){
	draw_sprite_ext(spr_bucket, 0, i * (16+sprite_get_width(spr_bucket)*0.25) + display_get_gui_width() * 0.66, sprite_get_height(spr_bucket) * 0.33,0.25,0.25,0.5, (ctrl.humanPosition <= 3 - i) ? c_white : c_black , 1 );
}

draw_text(display_get_gui_width() * 0.66, display_get_gui_height() - 2 * string_height("press here"), "Press Enter or A/X to continue");
