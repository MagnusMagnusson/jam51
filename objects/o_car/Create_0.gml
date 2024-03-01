var enginePower = 1;
var breakingPower = 5;
var handlingPower = 3;
var airDrag = 0.01 / 15;
var wheelDrag = 40 * airDrag;
var corneringStiffness = 1;
scale = 20;
heading = 0;
angularSpeed = 0;
model = new Model("assets/models/van.obj", "assets/models/van.mtl");
engine = new CarEngine(id, enginePower, breakingPower, handlingPower, corneringStiffness, airDrag, wheelDrag);