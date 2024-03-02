function keep_car_on_track(){
	if(ctrl.circuit){
		var old = lastKnownCircuitPosition;
		lastKnownCircuitPosition = ctrl.circuit.getPositionOnTrack(x, y, lastKnownCircuitPosition != 0 ? lastKnownCircuitPosition - 0.1 : 0, lastKnownCircuitPosition != 0 ? lastKnownCircuitPosition + 0.1 : 1, 0, 0)
		if(lastKnownCircuitPosition >= 1){
			lastKnownCircuitPosition -= 1;
		}
		if(lastKnownCircuitPosition < old && old >= 0.99){
			show_debug_message("NEW LAP", circuitDistance);
			circuitDistance = 0;
		} else {
			circuitDistance = ctrl.circuit.getDistanceFromTrack(x, y, lastKnownCircuitPosition, 0 , 0);
		}
		var trackHeading = ctrl.circuit.getDirection(lastKnownCircuitPosition);
		var ad = angle_difference(heading, trackHeading);
		if(abs(ad) > 70){
			heading -= sign(ad);
		
		}

		if(circuitDistance > ctrl.circuit_width / 2 + 32){
			if(circuitDistance > 2 * ctrl.circuit_width){
				x = ctrl.circuit.getTrueX(lastKnownCircuitPosition, 0);
				y = ctrl.circuit.getTrueY(lastKnownCircuitPosition, 0);
				speed = 0;
				disable_inputs = 1 * fps;
				direction = trackHeading;
			} else {
				speed = speed * 0.9;
			}
		}
	}

}