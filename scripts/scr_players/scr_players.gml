global._playerManager = undefined;

function Players(){
	if(is_undefined(global._playerManager)){
		global._playerManager = new PlayerManager();
	}
	
	return global._playerManager;
}



function PlayerManager() constructor{
	players = [];
	
	human = function(){
		with(o_car){
			if(is_human){
				return id;
			}
		}
		return noone;
	}
	
	create = function(count, humanIndex, difficulty, cheatLevel){
		var playerNames = [
			"CleanCorp LLC.",
			"Joel's Cleaning Services",
			"Bob",
			"Banhammer Stain Removal",
			"Washtorium",
			"GMC Cleaning Services",
			"Team Clean INC",
			"Raccoon Washing Corporation",
			"YoYoClean",
			"The Other Cleaner"
		]


		var robotCheat = cheatLevel;
		var robotCheatIncrement = 0.1 / (count - 1);
		var racers = [];
		for(var i = 0; i < count; i++){
			var r = new Player(i == humanIndex ? "You!" : playerNames[i], i == humanIndex);
			r.car_object.engine.enginePower = difficulty;
			if(i != humanIndex){
				r.car_object.engine.enginePower *= robotCheat;
				robotCheat -= robotCheatIncrement;
			}
			array_push(racers, r);
		}
		players = racers;
		return racers;
	}
	
	getPosition = function(carId){
		var p = 1;
		with(o_car) if(id != carId){
			if( carId.lap < lap || (carId.lap == lap && carId.lastKnownCircuitPosition < lastKnownCircuitPosition)){
				p++;
			}
		}
		return p;
	}
	
	estimateFinishTime = function(player){
		if(player.lap > ctrl.laps){
			return player.finalTime;
		}
		var progress = (player.lastKnownCircuitPosition + (player.lap - 1)) / ctrl.laps;
		var fakeTime = ctrl.laps * (player.timer / progress);
		return fakeTime;
	}
}

function Player(name, isHuman) constructor{
	car_object = instance_create_layer(0,0,layer_get_id("overground"), o_car);
	car_object.is_human = isHuman;
	car_object.engine.skiddingSpeed = isHuman ? 20 : 2000;
	car_object.name = name;
}