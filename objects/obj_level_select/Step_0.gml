var in = Input();


if(in.getButtonPressed(Input_Actions.Confirm)){
	var lev = Levels().getCupLevels(cup)[level];
	var stars = Levels().getStarCount();
	if(stars >= lev.unlock){
		global.level = lev;
		room_goto(rm_race);
	}
}


if(in.getButtonPressed(Input_Actions.Down)){
	cup = (cup + 1) % array_length(cups);
}

if(in.getButtonPressed(Input_Actions.Up)){
	cup = (array_length(cups) + cup - 1) % array_length(cups);
}

if(in.getButtonPressed(Input_Actions.Right)){
	level = (level + 1) % array_length(cups[cup]);
}

if(in.getButtonPressed(Input_Actions.Left)){
	level = (array_length(cups[cup]) + level - 1) % array_length(cups[cup]);
}
