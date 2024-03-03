var gdc = gamepad_get_device_count();
connected_controller_count = 0;
for(var i = 0; i < gdc; i++){
	if(gamepad_is_connected(i)){
		connected_controller_count++;
		if(gamepad_button_check_pressed(i, gp_start)){
			gamepad_set_axis_deadzone(i, 0.2);
			Input().controller = i;
		}
	}
}

var in = Input();
if(in.getButtonPressed(Input_Actions.Confirm)){
	if(menu_layer == menu_layers.DEMO){
		menu_layer = menu_layers.MAIN;
	} else{
		option_functions[selected]();
	}
}

if(in.getButtonPressed(Input_Actions.Down)){
	selected = (selected + 1) % array_length(option_text);
}

if(in.getButtonPressed(Input_Actions.Up)){
	selected = (array_length(option_text) + selected - 1) % array_length(option_text);
}
