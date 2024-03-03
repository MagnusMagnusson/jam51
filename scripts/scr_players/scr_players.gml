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
	
	create = function(count, humanIndex){
		var racers = [];
		for(var i = 0; i < count; i++){
			var r = new Player(i == humanIndex);
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
}

function Player(isHuman) constructor{
	car_object = instance_create_layer(0,0,layer_get_id("overground"), o_car);
	car_object.is_human = isHuman;
	car_object.engine.skiddingSpeed = isHuman ? 20 : 2000;
}