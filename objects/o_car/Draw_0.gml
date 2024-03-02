
if(!o_camera.debugCameraEnabled){
	//o_camera.skybox.draw_ext(x,y, -50, 0, 0, 0, 1000,1000,-1000);
}

model.draw(x, y, 0, 0, 0, heading - 90, scale);


draw_self();
draw_set_color(c_red);
draw_arrow(x,y, x + lengthdir_x(80, heading + engine.wheelAngle),  y + lengthdir_y(80, heading + engine.wheelAngle), 22);

var xx, yy;
if(ctrl.circuit){
	xx = 0 + path_get_x(ctrl.circuit.path, lastKnownCircuitPosition) * ctrl.circuit.scale;
	yy = 0 + path_get_y(ctrl.circuit.path, lastKnownCircuitPosition) * ctrl.circuit.scale;
	draw_set_color(c_red);
	draw_circle(xx , yy , 50, false)
	draw_arrow(x, y, xx , yy , 50);
} else {
	draw_rectangle(x-100,y-100,x+100,y+100,false);
}