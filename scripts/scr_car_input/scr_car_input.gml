function process_car_input(){
	
	if(disable_inputs <= 0){
		var input = Input();

		var acc = input.getButton(Input_Actions.Accelerate);
		var dec = input.getButton(Input_Actions.Break);
		var left = input.getButton(Input_Actions.Left);
		var right = input.getButton(Input_Actions.Right);

		if(acc > 0){
			//We are accelerating
			engine.applyTraction(heading, acc)
		}
		if(dec > 0){
			if(speed > 0){
				//Breaking
				engine.applyBreaks(heading, dec);
			} else {
				//Reverse
				engine.applyTraction(heading, -0.01 * acc);
			}
		}
	
		if(left > 0 || right > 0){
			engine.turnWheels(left - right);
		} else{
			if(abs(engine.wheelAngle) > 1){
			engine.turnWheels(-sign(engine.wheelAngle));
			} else{
				engine.wheelAngle = 0;
			}
		}

		if(engine.wheelAngle != 0){
			engine.applyAngularVelocity(speed, heading);
		}
	} else {
		heading = stored_heading + disable_inputs * 5;
		disable_inputs--;
		if(disable_inputs <= 0){
			heading = stored_heading;
			direction = heading;
		}
	}
	engine.applyDrag(hspeed, vspeed, speed);
	engine.applyWheelDrag(direction, speed);
}