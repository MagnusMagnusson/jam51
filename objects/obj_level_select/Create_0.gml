connected_controller_count = 0;
audio_falloff_set_model(audio_falloff_exponent_distance);
alarm[0] = 2;

selected = 0;
menu_layer = 0;


option_text = [
	"Job Select",
	"Exit"
]

show_blink = true;

enum menu_layers {
	DEMO,
	MAIN,
}



option_functions = [
	function(){ 
		instance_destroy();
		instance_create_layer(0,0,layer, obj_level_select);
	},
	function(){ game_end()},
]