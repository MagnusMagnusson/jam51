global.InputClass = undefined;

function Input(){
	if(is_undefined(global.InputClass)){
		global.InputClass = new __Input();
	}
	return global.InputClass;
}

enum Input_Actions {
	Accelerate,
	Break,
	Left,
	Right
}

function __Input() constructor{
	keyboard_config = [];
	keyboard_config[@ Input_Actions.Accelerate] = vk_up;
	keyboard_config[@ Input_Actions.Break] = vk_down;
	keyboard_config[@ Input_Actions.Left] = vk_left;
	keyboard_config[@ Input_Actions.Right] = vk_right;
	
	gamepad_config = [];
	gamepad_config[@ Input_Actions.Accelerate] = gp_shoulderrb;
	gamepad_config[@ Input_Actions.Break] = gp_shoulderlb;
	gamepad_config[@ Input_Actions.Left] = gp_padl;
	gamepad_config[@ Input_Actions.Right] = gp_padr;
	
	controller = undefined;
	
	static getButton = function(action){
		return keyboard_check(keyboard_config[@action]);
	}
}
