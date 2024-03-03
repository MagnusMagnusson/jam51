draw_set_color(c_black);
draw_rectangle(0,0,display_get_gui_width() * 0.05, display_get_gui_height() * 0.05, false);
draw_set_color(c_white);
draw_set_font(fnt_bog);
var human = Players().human();
var pos = Players().getPosition(human);
draw_text(32,32,"LAP "+string(human.lap) + " / " + string(laps));

draw_set_halign(fa_right);
var minutes = string_replace(string_format(human.timer div 60,2,0)," ","0");
var seconds = string_replace(string_format(floor(human.timer % 60),2,0)," ","0");
var micro = string_replace(string_format(100 * frac(human.timer),2,0)," ","0");
draw_text(display_get_gui_width() - 32,32,string("{0}:{1}.{2}", minutes, seconds, micro ));

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(display_get_gui_width() / 2,32, string(pos)+" / " + string(array_length(Players().players)));

draw_set_font(fnt_giant);

if(countdown > 0 && countdown <= 3){
	draw_text(display_get_gui_width() / 2 , display_get_gui_height() / 2, ceil(countdown));
} 
if(messageTimer > 0){
	draw_text(display_get_gui_width() / 2 , display_get_gui_height() / 2, message);
} 

draw_set_halign(fa_left);
draw_set_valign(fa_top);