process_car_input(is_human, heading, lastKnownCircuitPosition);
keep_car_on_track();

var wall = instance_place(x + hspeed, y + vspeed, o_wall);
if(wall){
	while(instance_place(x + hspeed, y + vspeed, o_wall)){
		x = x + lengthdir_x(1, point_direction(wall.x, wall.y, x, y));
		y = y + lengthdir_y(1, point_direction(wall.x, wall.y, x, y));
	}
	if(abs(speed) > 20){
		speed = -speed * 0.5;
		disable_inputs = 1 * fps;
		stored_heading = heading;
	}
}

var competitor = instance_place(x + hspeed, y + vspeed, o_car)
if(competitor){
	var speedDiff = abs(abs(speed) - abs(other.speed)) / 4;
	var pd = point_direction(x,y, other.x, other.y);
	motion_add(pd + 180, speedDiff);
	
	with(other){
		motion_add(pd, speedDiff);
	}
	while(instance_place(x + hspeed, y + vspeed, competitor)){
		x = x + lengthdir_x(1, point_direction(competitor.x, competitor.y, x, y));
		y = y + lengthdir_y(1, point_direction(competitor.x, competitor.y, x, y));
	}
}

image_angle = heading;
audio_emitter_position(emitter, x, y, 0);
audio_sound_pitch(engine_rev, engine.rpm)
