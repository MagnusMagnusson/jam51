global.__levels = undefined;

function Levels(){
	if(is_undefined(global.__levels)){
		global.__levels = new _Levels();
	}
	return global.__levels;
}

function _Levels() constructor{
	levels = [];
	var diff = [
		1.5,
		2,
		2.5,
		3,
		3.333
	]
	
	var cheating =  [
		0.8,
		0.85,
		0.95,
		1,
		1.02
	]
	
	add = function(level){
		array_push(levels, level);
	}
	
	getAll = function(){
		return self.levels;
	}
	
	getCupLevels = function(cup){
		global.________waste = cup;
		return array_filter(self.levels, function(l){return l.cup._id == global.________waste});
	}
	
	getCupLength = function(cup){
		return array_length(self.getCupLevels(cup)); 
	}
	
	getCupCount = function(){
		var c = [];
		for(var i = 0; i < array_length(levels); i++){
			var level = levels[i];
			if(array_get_index(c, level.cup) == -1){
				array_push(c, level.cup);
			}
		}
		return array_length(c);
	}
	
	getStarCount = function(){
		var _levels = self.getAll();
		var s = 0;
		for(var i = 0; i < array_length(_levels); i++){
			s += _levels[i].bestStars;
		}
		return s;
	}
	
	var morning = new Cup(0, "Morning Training", noone);
	var noon = new Cup(1, "Noon Delivery", noone);
	var afternoon = new Cup(2, "Tea-Time Tumble", noone);
	var evening = new Cup(3, "Evening Rush", noone);
	var night = new Cup(4, "Midnight Madness", noone);
	
	add(new Level(0, "The First Job", path_test, 1, morning, 0, diff[0], cheating[0], 0, 0, 0));
	add(new Level(1, "Figure Eight", path_figure_eight, 1, morning, 0, diff[0], cheating[0], 0, 0, 0));
	add(new Level(2, "Tight corners", path_corners, 1, morning, 0, diff[0], cheating[0], 0, 0, 0));
	add(new Level(3, "A long stretch", path_marathon, 1, morning, 0, diff[0], cheating[0], 0, 0, 0));
		
	add(new Level(4, "Picking up speed", path_test, 3, noon, 8, diff[1], cheating[1], 0, 0, 0));
	add(new Level(5,"Three Times Eight", path_figure_eight, 3, noon, 8, diff[1], cheating[1], 0, 0, 0));
	add(new Level(6, "More Corners", path_corners, 3, noon, 8, diff[1], cheating[1], 0, 0, 0));
	add(new Level(7, "Urgent Delivery", path_marathon, 3, noon, 8, diff[2], cheating[1], 0, 0, 0));
		
	add(new Level(8, "No Time To Rest", path_test, 3, afternoon, 16, diff[2], cheating[2], 0, 0, 0));
	add(new Level(9, "Car, meet road", path_figure_eight, 3, afternoon, 16, diff[2], cheating[2], 0, 0, 0));
	add(new Level(10, "Halfway point", path_corners, 3, afternoon, 16, diff[2], cheating[2], 0, 0, 0));
	add(new Level(11, "Soap!", path_marathon, 3, afternoon, 16, diff[3], cheating[2], 0, 0, 0));
		
	add(new Level(12, "On even ground", path_test, 3, evening, 25, diff[3], cheating[3], 0, 0, 0));
	add(new Level(13, "Speed demon", path_figure_eight, 3, evening, 25, diff[3], cheating[3], 0, 0, 0));
	add(new Level(14, "Slide those corners", path_corners, 3, evening, 25, diff[3], cheating[3], 0, 0, 0));
	add(new Level(15, "The final gate", path_marathon, 3, evening, 25, diff[3], cheating[3], 0, 0, 0));
		
	add(new Level(16, "Mastery: Curves", path_test, 3, night, 57 - 9 - 3, diff[4], cheating[4], 0, 0, 0));
	add(new Level(17, "Mastery: Straights", path_figure_eight, 3, night, 57 - 6 - 2, diff[4], cheating[4], 0, 0, 0));
	add(new Level(18, "Mastery: Corners", path_corners, 3, night, 57 - 3 - 1, diff[4], cheating[4], 0, 0, 0));
	add(new Level(19, "Van Driver Supreme", path_marathon, 3, night, 57, diff[4], cheating[4], 0, 0, 0));
	
}

function Level(__id, _name, _path, _laps, _cup, _unlock, _speed, _aiBoost, _bestTime, _bestStars, _bestPosition) constructor{
	_id = __id;
	name = _name;
	cup = _cup;
	unlock = _unlock;
	bestTime = _bestTime;
	bestStars = _bestStars;
	bestPosition = _bestPosition;
	path = _path;
	laps = _laps;
	difficulty = _speed;
	aiBoost = _aiBoost;
}

function Cup(__id, _name, _sprite) constructor{
	_id = __id;
	name = _name;
	sprite = _sprite;
}

//Always have one level defined
global.level = Levels().getAll()[0];