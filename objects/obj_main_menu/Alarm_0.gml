var gdc = gamepad_get_device_count();
for(var i = 0; i < gdc; i++){
	if(gamepad_is_connected(i)){
		gamepad_set_axis_deadzone(i, 0.2);
		Input().controller = i;
		break;
	}
}
