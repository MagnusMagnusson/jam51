circuit = new Circuit(Path1, 8);
circuit_width = 600;
flag = ModelManager().get("finish_flag");
laps = 1;
countdown = 5;
message = ""; 
messageTimer = 0;
halfLap = function(car){
	car.halfLap = true;
}

fullap = function(car){
	if(car.halfLap){
		car.lap++;
		car.halfLap = false;
		if(car.lap == laps && car.is_human){
			message = "FINAL LAP!";
			messageTimer = 3;
		}
		if(car.lap > laps){
			car.is_human = false;
		}
	}
}

racers = Players().create(10, 9);
circuit.positionRacers(racers, circuit_width, 0);