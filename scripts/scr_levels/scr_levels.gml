global.__levels = undefined;

function Levels(){
	if(is_undefined(global.__levels)){
		global.__levels = new _Levels();
	}
}

function _Levels() constructor{
	levels = [];
	var diff = [
		1.5,
		1.75,
		2,
		2.25,
		3
	]
	
	var cheating =  [
		1,
		1.1,
		1.2,
		1.3,
		1.5
	]
	
	
	add(
		new Level("The First Job", path_test, 0, 0, diff[0], cheating[0], 0, 0),
		new Level("Figure Eight", path_test, 0, 0, diff[0], cheating[0], 0, 0),
		new Level("Easy pickings", path_test, 0, 0, diff[0], cheating[0], 0, 0),
		new Level("A long stretch", path_test, 0, 0, diff[1], cheating[0], 0, 0),
		
		
		new Level("Picking up heat", path_test, 1, 8, diff[1], cheating[1], 0, 0),
		new Level("Figure Eight", path_test, 1, 8, diff[1], cheating[1], 0, 0),
		new Level("Easy pickings", path_test, 1, 8, diff[1], cheating[1], 0, 0),
		new Level("A long stretch", path_test, 1, 8, diff[2], cheating[1], 0, 0),
		
		new Level("Picking up heat", path_test, 2, 16, diff[2], cheating[2], 0, 0),
		new Level("Figure Eight", path_test, 2, 16, diff[2], cheating[2], 0, 0),
		new Level("Easy pickings", path_test, 2, 16, diff[2], cheating[2], 0, 0),
		new Level("A long stretch", path_test, 2, 16, diff[3], cheating[2], 0, 0),
		
		
		new Level("Picking up heat", path_test, 3, 25, diff[3], cheating[3], 0, 0),
		new Level("Figure Eight", path_test, 3, 25, diff[3], cheating[3], 0, 0),
		new Level("Easy pickings", path_test, 3, 25, diff[3], cheating[3], 0, 0),
		new Level("A long stretch", path_test, 3, 25, diff[3], cheating[3], 0, 0),
		
		
		new Level("Picking up heat", path_test, 4, 57 - 9 - 3, diff[4], cheating[4], 0, 0),
		new Level("Figure Eight", path_test, 4, 57 - 6 - 2, diff[4], cheating[4], 0, 0),
		new Level("Easy pickings", path_test, 4, 57 - 3 - 1, diff[4], cheating[4], 0, 0),
		new Level("A long stretch", path_test, 4, 57, diff[4], cheating[4], 0, 0),
	
	add = function(level){
		levels = array_push(level);
	}
}

function Level(_name, _path, _cup, _unlock, _speed, _aiBoost, _bestTime, _bestStars) constructor{
	name = _name;
	cup = _cup;
	unlock = _unlock;
	bestTime = _bestTime;
	bestStars = _bestStars;
	path = _path;
	difficulty = _speed;
	aiBoost = _aiBoost;
}