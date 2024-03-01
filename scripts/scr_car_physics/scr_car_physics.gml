function CarEngine(_car, _enginePower,_breakPower, _handling, _cornering, _drag, _friction) constructor{
	enginePower = _enginePower;	
	breakPower = _breakPower;
	maxHandling = _handling; 
	dragForce = _drag;
	corneringStiffness = _cornering
	frictionForce = _friction;
	car = _car;
	wheelAngle = 0;
	wheelBase = 8;
	
	
	applyTraction = function(_direction, force){
		show_debug_message("drive {0}",enginePower * force)
		var f = enginePower * force;
		with(car){
			motion_add(_direction, f);
		}
	}
	
	applyBreaks = function(_direction, force){
		var f = -breakPower * force;
		with(car){
			motion_add(_direction, f);
		}
	}
	
	applyDrag = function(_hspeed, _vspeed,  _speed){
		var _xdrag = -dragForce * _hspeed * _speed;
		var _ydrag = -dragForce * _vspeed * _speed;
		show_debug_message("drag {0} {1}",point_direction(0,0,_xdrag,_ydrag), point_distance(0,0,_xdrag,_ydrag));
		with(car){
			motion_add(point_direction(0,0,_xdrag,_ydrag), point_distance(0,0,_xdrag,_ydrag));
		}
	}
	
	applyWheelDrag = function(_direction, _speed){
		var f = -_speed * frictionForce;
		with(car){
			motion_add(_direction, f);
			show_debug_message("wheel {0} {1}",_direction, f);
		}
	}
	
	turnWheels = function(dir){
		wheelAngle = clamp(wheelAngle + maxHandling * dir,-50,50);
	}
	
	applyAngularVelocity = function(_speed, _heading){
		var R = self.getTurningRadius(_heading);
		var W = self.getAngularVelocity(_heading, _speed);
		with(car){
			direction += W;
			heading += W;
		}
	}
	
	static getTurningRadius = function(heading){
		var radian = degtorad(wheelAngle);
		var turnRadius = wheelBase / sin(radian);
		show_debug_message("Turn Radius {0}", turnRadius);
		return turnRadius;
	}
	
	static getAngularVelocity = function(_heading, _speed){
		var w =  _speed / self.getTurningRadius(_heading);
		show_debug_message("Angular Velocity  {0}", w);
		return w;
	}
}