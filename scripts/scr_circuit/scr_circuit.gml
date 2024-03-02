function Circuit(_path, _scale) constructor{
	path = _path;
	scale = _scale;
	
	getDirection = function(point){
		var x1 = path_get_x(path, point);
		var y1 = path_get_y(path, point);
		var x2 = path_get_x(path, point + 0.001);
		var y2 = path_get_y(path, point + 0.001);
		return point_direction(x1,y1,x2,y2);
	}
	
	draw = function(__x, __y, progressStart, progressEnd, width, precision){
	    var halfWidth = width / 2;
    
	    draw_primitive_begin(pr_trianglestrip);
		var increment = (progressEnd - progressStart) / precision;

	    for (var i = progressStart; i <= progressEnd; i += increment) {

			var startX = path_get_x(path, i) * scale;
		    var startY = path_get_y(path, i) * scale;
		    var endX = path_get_x(path, i + increment) * scale;
		    var endY = path_get_y(path, i + increment) * scale;
			var _d = point_direction(startX, startY, endX, endY);
        
	        var offsetX_progress = lengthdir_x(halfWidth, _d + 90);
	        var offsetY_progress = lengthdir_y(halfWidth, _d + 90);
        
	        var startX1 = startX + offsetX_progress;
	        var startY1 = startY + offsetY_progress;
	        var startX2 = startX - offsetX_progress;
	        var startY2 = startY - offsetY_progress;
        
	        draw_vertex(__x + startX1, __y + startY1);
	        draw_vertex(__x + startX2, __y + startY2);
	    }
    
	    draw_primitive_end();	
	}
	
	getPositionOnTrack = function(xx,yy, minP, maxP, xoff, yoff, epsilon = 1/1000){
		var startD = -1;
		var iter = 1/1000;
		var a,b;
		a = minP;
		b = maxP;
		for(var i = minP + iter; i < maxP; i += iter){
			var dd = getDistance(xx, yy, xoff + scale * path_get_x(path, i), yoff + scale * path_get_y(path, i));
			//show_debug_message("i, dd, maxD {0} {1} {2} {3} {4}", i, dd, startD, maxP, i + iter);
			if(startD == -1 || dd <= startD){
				a = i;
				b = i + iter;
				startD = dd;
			}
		}
		var f = frac((a+b) / 2);
		if(abs(f - ((minP + maxP) / 2)) < epsilon){
			return ((minP + maxP) / 2);
		}
		return frac((a + b)/ 2);
	}
	
	getDistanceFromTrack = function(xx, yy, position, xoff, yoff){
		var _x = path_get_x(path, position) * scale + xoff;
		var _y = path_get_y(path, position) * scale + yoff;
		return point_distance(xx,yy, _x, _y);
		
	}
	
	getTrueX = function(pos, offset){
		return offset + scale * path_get_x(path, pos);
	}	
	
	getTrueY = function(pos, offset){
		return offset + scale * path_get_y(path, pos);
	}
	
	getDistance = function(a,b,aa,bb){
		var dx = a-aa;
		var dy = b-bb;
		return dx*dx + dy*dy;
	}
	
}