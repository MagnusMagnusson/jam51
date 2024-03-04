global.__save = undefined;

function SaveFile() constructor{
	if(is_undefined(global.__save)){
		global.__save = new _Save();
	}
	return global.__save;
}

	global.skipToLevelSelect = false;
	
function _Save() constructor{
	fname = "user_data/save.json";
	load = function(){	
		if(file_exists(fname)){
			var data = json_load_file(fname);
			if(is_undefined(data)){
				return;
			}
			var ll = Levels().getAll();
			for(var i = 0; i < array_length(ll); i++){
				var l = ll[i];
				var d = data[$"levels"][$"level_"+string(l._id)];
				l.bestTime = d.bestTime;
				l.bestStars = d.bestStars;
				l.bestPosition = d.bestPosition;
			}
		}
	}
	
	save = function(){
		var d = {};
		d[$"levels"] = {};
		var allLevels = Levels().getAll();
		for(var i = 0; i < array_length(allLevels); i++){
			var l = allLevels[i];
			var ll = {};
			ll.bestTime = l.bestTime;
			ll.bestStars = l.bestStars;
			ll.bestPosition = l.bestPosition;
			d[$"levels"][$"level_"+string(l._id)] = ll;
		}
		json_save_file(fname, d);
	}
}