
if(instance_exists(o_car)){
	var camera = camera_get_active();
	var fov = 70;
	var distance_behind = debugCameraEnabled ? 1 : 148;	
	var distance_in_front = debugCameraEnabled ? 1 : 40;
	var camera_height = debugCameraEnabled ? 1000 : 120;
	var camera_target_height = debugCameraEnabled ? 0 : 40;

	camera_set_view_mat(camera, matrix_build_lookat(
		o_car.x + lengthdir_x(distance_behind, 180 + o_car.heading), 
		o_car.y + lengthdir_y(distance_behind, 180 + o_car.heading), 
		camera_height,
		o_car.x  + lengthdir_x(distance_in_front, o_car.heading), 
		o_car.y + lengthdir_y(distance_in_front, o_car.heading), 
		camera_target_height, 0, 0, -1));
	camera_set_proj_mat(camera, matrix_build_projection_perspective_fov(fov, -window_get_width() / window_get_height(), 1, 32000));
	camera_apply(camera);
}

draw_rectangle(0,0,room_width, room_height, false);