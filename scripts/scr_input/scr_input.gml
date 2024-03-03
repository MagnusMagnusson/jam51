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
	Right,
	Confirm,
	Up,
	Down
}

function __Input() constructor{
	keyboard_config = [];
	keyboard_config[@ Input_Actions.Accelerate] = ord("W");
	keyboard_config[@ Input_Actions.Up] = ord("W");
	keyboard_config[@ Input_Actions.Down] = ord("S");
	keyboard_config[@ Input_Actions.Break] = ord("S");
	keyboard_config[@ Input_Actions.Left] = ord("A");
	keyboard_config[@ Input_Actions.Right] = ord("D");
	keyboard_config[@ Input_Actions.Confirm] = vk_enter;
	
	gamepad_config = [];
	gamepad_config[@ Input_Actions.Accelerate] = gp_shoulderrb;
	gamepad_config[@ Input_Actions.Break] = gp_shoulderlb;
	gamepad_config[@ Input_Actions.Up] = gp_padu;
	gamepad_config[@ Input_Actions.Down] = gp_padd;
	gamepad_config[@ Input_Actions.Left] = gp_padl;
	gamepad_config[@ Input_Actions.Right] = gp_padr;
	gamepad_config[@ Input_Actions.Confirm] = gp_face1;
	
	controller = undefined;
	
	static getButton = function(action){
		var kb = keyboard_check(keyboard_config[@action]);
		var gp = 0;
		if(controller){
			gp = gamepad_button_check(controller, gamepad_config[@action]);
			if(action == Input_Actions.Left){
				gp = -clamp(gamepad_axis_value(controller, gp_axislh), -1,0);
			}		
			if(action == Input_Actions.Right){
				gp = clamp(gamepad_axis_value(controller, gp_axislh), 0,1);
			}		
		}
		
		return max(kb,gp);
	}
	
	static getButtonPressed = function(action){
		var kb = keyboard_check_pressed(keyboard_config[@action]);
		var gp = 0;
		if(controller){
			gp = gamepad_button_check_pressed(controller, gamepad_config[@action]);	
		}
		
		return max(kb,gp);
	}
}
