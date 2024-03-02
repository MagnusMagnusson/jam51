var enginePower = 2;
var breakingPower = 5;
var handlingPower = 3;
var airDrag = 0.01 / 15;
var wheelDrag = 50 * airDrag;
var corneringStiffness = 1;
lastKnownCircuitPosition = 0;
circuitDistance = 0;
scale = 20;
disable_inputs = 0;
heading = 0;
stored_heading = heading;
angularSpeed = 0;
model = ModelManager().get("van");
lap = 1;
is_human = true;
engine = new CarEngine(id, enginePower, breakingPower, handlingPower, corneringStiffness, airDrag, wheelDrag);