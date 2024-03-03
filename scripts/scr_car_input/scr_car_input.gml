function process_car_input(is_human, heading, lastKnownCircuitPosition){
	if(disable_inputs <= 0){
		var acc, dec, left, right;
		if(is_human){
			var input = Input();

			acc = input.getButton(Input_Actions.Accelerate);
			dec = input.getButton(Input_Actions.Break);
			left = input.getButton(Input_Actions.Left);
			right = input.getButton(Input_Actions.Right);
		} else {
			var ai = robot_get_input(lastKnownCircuitPosition, heading );
			acc = ai[$"acc"];
			dec = ai[$"dec"];
			left = ai[$"left"];
			right = ai[$"right"];
		}
		
		if(ctrl.countdown > 0){
			//Race not started.
			return;
		}

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

function robot_get_input(circuitPosition, carHeading){
	var inputs = {
		acc : 0,
		dec : 0,
		left : 0,
		right : 0
	}
	inputs[$"acc"] = 1;
	var desiredDirection = ctrl.circuit.getDirection(circuitPosition);
	var w = ctrl.circuit_width;
	var distanceFromTrack = ctrl.circuit.getDistanceFromTrack(x,y, circuitPosition, 0, 0);
	if(distanceFromTrack > w/2 - 32){
		inputs[$"acc"] = 1;
		var center_x = ctrl.circuit.getTrueX(circuitPosition + 0.01, 0);
		var center_y = ctrl.circuit.getTrueY(circuitPosition + 0.01, 0);
		var ad = angle_difference(carHeading,point_direction(x, y, center_x, center_y));
		if(abs(ad) > 5){
			if(ad < 0){
				inputs[$"right"] = 0;
				inputs[$"left"] = 1;
			} else {
				inputs[$"left"] = 0;
				inputs[$"right"] = 1;
			}
		}
	} else {
		var ad = angle_difference(carHeading,desiredDirection);
		if(abs(ad) > 5){
			if(ad < 0){
				inputs[$"right"] = 0;
				inputs[$"left"] = 1;
			} else {
				inputs[$"left"] = 0;
				inputs[$"right"] = 1;
			}
		}
	}
	
	return inputs;
}