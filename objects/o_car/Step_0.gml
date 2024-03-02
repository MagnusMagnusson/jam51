process_car_input();
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


image_angle = heading;
