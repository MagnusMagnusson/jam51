global._playerManager = undefined;

function Players(){
	if(is_undefined(global._playerManager)){
		global._playerManager = new PlayerManager();
	}
	
	return global._playerManager;
}

function PlayerManager() constructor{
	human = function(){
		with(o_car){
			if(is_human){
				return id;
			}
		}
		return noone;
	}
}