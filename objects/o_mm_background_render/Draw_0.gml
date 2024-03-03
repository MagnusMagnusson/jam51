var camera = camera_get_active();
var fov = 70;


camera_set_view_mat(camera, matrix_build_lookat(
	0,
	0,
	z,
	xto, 
	yto, 
	zto, 0, 0, -1));
camera_set_proj_mat(camera, matrix_build_projection_perspective_fov(fov, -window_get_width() / window_get_height(), 1, 3200));
camera_apply(camera);

van.draw(xto,yto,5,0,0,90,5);
draw_set_color(c_gray);
draw_rectangle(0, yto - 20, room_width, yto + 20, false);

for(var i = 0; i < array_length(trees); i++){
	var tree = trees[i];
	tree.draw(-500 + ((treexx + 100 * i) % 1000), yto + 50, 0, 0,0,0,2);
	tree.draw(-500 + ((treexx + 88 * i) % 1000), yto + 100, 0, 0,0,0,2);
	tree.draw(-500 + ((treexx + 94 * i) % 1000), yto + 200, 0, 0,0,0,2);
}

for(var i = 0; i < array_length(houses); i++){
	var house = houses[i];
	house.draw(-500 + ((treexx + 100 * i) % 1000), yto + 300, 0, 0,0,0, 10);
}