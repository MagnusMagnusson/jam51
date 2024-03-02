draw_set_color(c_gray);
circuit.draw(0, 0, 0, 1, circuit_width, 150);

var startX = circuit.getTrueX(0,0);
var startY = circuit.getTrueY(0,0);

flag.draw_ext(startX, startY, 0, 0,0, circuit.getDirection(0),35,35,20);