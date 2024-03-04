draw_set_font(fnt_bog);
draw_text(128, display_get_gui_height() -  4 * string_height("!A"),  string("Loading, please wait! ({0}%)", (100 * loading / array_length(things_to_load))));
draw_set_font(fnt_smaller);
draw_text(128, display_get_gui_height() -  2*string_height("!A"), string("currently loading {0}: {1}", loadType, things_to_load[loading]));