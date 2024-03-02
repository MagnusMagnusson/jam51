draw_set_color(c_black);
draw_rectangle(0,0,window_get_width() * 0.05, window_get_height() * 0.05, false);
draw_set_color(c_white);
draw_set_font(fnt_bog);
var human = Players().human();
draw_text(32,32,"LAP "+string(human.lap) + " / " + string(laps));