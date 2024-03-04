ModelManager().get(things_to_load[loading]);
loading++;
if(loading >= array_length(things_to_load)){
	room_goto_next();
}
alarm[0] = 2;