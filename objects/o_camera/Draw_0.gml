
if(instance_exists(o_car)){
	var my_car = Players().human();
	var camera = camera_get_active();
	var fov = 70;
	var distance_behind = debugCameraEnabled ? 1 : 148;	
	var distance_in_front = debugCameraEnabled ? 1 : 40;
	var camera_height = debugCameraEnabled ? 1000 : 120;
	var camera_target_height = debugCameraEnabled ? 0 : 40;
	
	if(lookatDirection != my_car.heading){
		if(abs( angle_difference(lookatDirection, my_car.direction)) < 2){
			lookatDirection = my_car.heading;
		} else {
			lookatDirection -= 4 * sign(angle_difference(lookatDirection, my_car.direction));
		}
	}

	camera_set_view_mat(camera, matrix_build_lookat(
		my_car.x + lengthdir_x(distance_behind, 180 + lookatDirection), 
		my_car.y + lengthdir_y(distance_behind, 180 + lookatDirection), 
		camera_height,
		my_car.x  + lengthdir_x(distance_in_front, lookatDirection), 
		my_car.y + lengthdir_y(distance_in_front, lookatDirection), 
		camera_target_height, 0, 0, -1));
	camera_set_proj_mat(camera, matrix_build_projection_perspective_fov(fov, -window_get_width() / window_get_height(), 1, zplane));
	camera_apply(camera);
}

if(!debugCameraEnabled){
	//draw_rectangle(0,0,room_width, room_height, false);
}

