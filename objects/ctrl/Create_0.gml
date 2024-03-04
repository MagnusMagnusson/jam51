circuit = new Circuit(global.level.path, 8);
circuit_width = 600;
flag = ModelManager().get("finish_flag");
laps = global.level.laps;
countdown = 5;
message = ""; 
messageTimer = 0;
halfLap = function(car){
	car.halfLap = true;
}

results = [];
fullap = function(car){
	if(car.halfLap){
		car.lap++;
		car.halfLap = false;
		if(car.lap == laps && car.is_human){
			message = "FINAL LAP!";
			messageTimer = 3;
		}
		if(car.lap > laps){
			car.finalTime = car.timer;
			array_push(ctrl.results, car);
			if(car.is_human){
				var human = Players().human();
				global.level.bestStars = max(global.level.bestStars, 4 - Players().getPosition(human));
				global.level.bestTime = global.level.bestTime == 0 ? human.timer : min(human.timer, global.level.bestTime);
				global.level.bestPosition = global.level.bestPosition == 0 ?  Players().getPosition(human) : min(Players().getPosition(human), global.level.bestPosition);
				SaveFile().save();
				car.is_human = false;
				with(o_car){
					if(car.lap <= laps){
						array_push(ctrl.results, car);
					}
				}
				instance_create_layer(0,0,layer, o_race_results);
			}
		}
	}
}


racers = Players().create(10, 9, global.level.aiBoost);
circuit.positionRacers(racers, circuit_width, 0);