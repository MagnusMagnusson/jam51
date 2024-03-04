level = 0;
cup = 0;

cups = [];

var cup_count = Levels().getCupCount();
show_debug_message("Getting cups. found {0}", cup_count);
for(var i = 0; i < cup_count; i++){
	var _cup = Levels().getCupLevels(i);
	array_push(cups, _cup);
	show_debug_message("Cup {0} has {1} levels", i, array_length(_cup)); 
}