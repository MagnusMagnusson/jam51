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
		
		engine.rpm = lerp(engine.rpm, 0.5 + 2*acc, 1 / fps);
		if(dec > 0){
			engine.applyBreaks(direction, dec);
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
		id.heading = stored_heading + disable_inputs * 5;
		direction = heading;
		disable_inputs--;
		if(disable_inputs <= 0){
			id.heading = stored_heading;
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
	var desiredDirection = ctrl.circuit.getDirection(circuitPosition  + 0.005);
	var w = ctrl.circuit_width;
	var distanceFromTrack = ctrl.circuit.getDistanceFromTrack(x,y, circuitPosition, 0, 0);
	var ad = angle_difference(carHeading,desiredDirection);
	if(abs(ad) > 3){
		if(ad < 0){
			inputs[$"right"] = 0;
			inputs[$"left"] = 1;
		} else {
			inputs[$"left"] = 0;
			inputs[$"right"] = 1;
		}
	}
	
	if(distanceFromTrack > (w/2 + 16)){
		var center_x = ctrl.circuit.getTrueX(circuitPosition, 0);
		var center_y = ctrl.circuit.getTrueY(circuitPosition, 0);
		x -= sign(x - center_x);
		y -= sign(y - center_y);
	}

	return inputs;
}