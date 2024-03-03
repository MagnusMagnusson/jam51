function CarEngine(_car, _enginePower,_breakPower, _handling, _cornering, _drag, _friction) constructor{
	enginePower = _enginePower;	
	breakPower = _breakPower;
	maxHandling = _handling; 
	dragForce = _drag;
	corneringStiffness = _cornering
	skiddingSpeed = 20;
	frictionForce = _friction;
	car = _car;
	wheelAngle = 0;
	wheelBase = 8;
	rpm = 1;
	
	
	applyTraction = function(_direction, force){
		var f = enginePower * force;
		with(car){
			motion_add(_direction, f);
		}
	}
	
	applyBreaks = function(_direction, force){
		if(car.speed < 1){
			car.speed = 0;
		} else{
			car.speed = car.speed * 0.99;
		}
	}
	
	applyDrag = function(_hspeed, _vspeed,  _speed){
		var _xdrag = -dragForce * _hspeed * _speed;
		var _ydrag = -dragForce * _vspeed * _speed;
		with(car){
			motion_add(point_direction(0,0,_xdrag,_ydrag), point_distance(0,0,_xdrag,_ydrag));
		}
	}
	
	applyWheelDrag = function(_direction, _speed){
		var f = -_speed * frictionForce;
		with(car){
			motion_add(_direction, f);
		}
	}
	
	turnWheels = function(dir){
		wheelAngle = clamp(wheelAngle + maxHandling * dir,-50,50);
	}
	
	applyAngularVelocity = function(_speed, _heading){
		var R = self.getTurningRadius(_heading);
		var W = self.getAngularVelocity(_heading, _speed);
		var sp = self.skiddingSpeed;
		with(car){
			if(speed <= sp){
				direction += W;
				heading += W;
			} else {
				heading += W;
			}
		}
	}
	
	static getTurningRadius = function(heading){
		var radian = degtorad(wheelAngle);
		var turnRadius = wheelBase / sin(radian);
		return turnRadius;
	}
	
	static getAngularVelocity = function(_heading, _speed){
		var w =  _speed / self.getTurningRadius(_heading);
		return w;
	}
}