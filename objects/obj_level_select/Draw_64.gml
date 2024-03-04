draw_set_alpha(0.55);
draw_set_color(c_black);

draw_rectangle(0,0,display_get_gui_width(), display_get_gui_height(), false);

draw_set_alpha(1);
var stars = Levels().getStarCount();

var smallBucketScale = 0.075;
var cupCount = array_length(cups);
var seperation = 16;
var width = 256;
var height = 100;
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
for(var i = 0; i < cupCount; i++){
	var levelCount = array_length(cups[i]);
	for(var j = 0; j < levelCount; j++){
		var thisLevel = cups[i][j];
		var levelStars = thisLevel.bestStars;
		var unlock = thisLevel.unlock;
		
		var selected = i == cup && j == level;
		draw_set_color(selected ? c_white : c_gray);
		var x0, x1, y0, y1;
		x0 = seperation + (display_get_gui_width() / 2 + (width * (j - levelCount / 2)));
		x1 = -seperation + (display_get_gui_width() / 2 + (width * ((1+j) - levelCount / 2)));
		y0 = seperation + (display_get_gui_height() / 2 + (height * (i - cupCount / 2)));
		y1 = -seperation + (display_get_gui_height() / 2 + (height * ((1+i) - cupCount / 2)));
		draw_rectangle(x0,y0,x1,y1,false);
		
		if(stars < unlock){
			draw_sprite_ext(spr_bucket,0,(x0 + x1) / 2, (y0 + y1) / 2, smallBucketScale,smallBucketScale,0, c_black, 1);
			draw_set_color(c_yellow);
			draw_text((x0 + x1) / 2, (y0 + y1) / 2, unlock);
		} else {
			for(var b = 0; b < 3; b++){
				draw_sprite_ext(spr_bucket,0,(x0 + x1) / 2 + 8*(b-1) + ((b - 1) * sprite_get_width(spr_bucket) * smallBucketScale), (y0 + y1) / 2, smallBucketScale,smallBucketScale,0, 
				levelStars > b ? c_white : c_black,
				1);
			}
		}
		
	}
}

var bucketScale = 0.1;

draw_set_color(c_white);
var highlightedLevel = cups[cup][level];
if(stars >= highlightedLevel.unlock){
	draw_text((display_get_gui_width() / 2),  display_get_gui_height() - (sprite_get_height(spr_bucket) / 2) * bucketScale - 2*string_height("a"),
	string("{0} - {1}. Best time : {2}, position {3}",
			highlightedLevel.cup.name,
			highlightedLevel.name,
			highlightedLevel.bestTime,
			highlightedLevel.bestPosition
		)
	);

} else {
	draw_text((display_get_gui_width() / 2),  display_get_gui_height() - (sprite_get_height(spr_bucket) / 2) * bucketScale - 2*string_height("a"),
	string("*** LOCKED - EARN {0} MORE {1}!***", highlightedLevel.unlock - stars,(highlightedLevel.unlock - stars) == 1 ? "WASHING BUCKET" : "WASHING BUCKETS"));
}



draw_set_color(c_yellow);
draw_sprite_ext(spr_bucket,0, 16 + (display_get_gui_width() / 2), display_get_gui_height() - (sprite_get_height(spr_bucket) / 2) * bucketScale, bucketScale,bucketScale, 0, c_white, 1);
draw_text( display_get_gui_width() / 2 - sprite_get_width(spr_bucket) * bucketScale - 8, display_get_gui_height() - (sprite_get_height(spr_bucket) / 2) * bucketScale - 16, 
string("{0} X ", stars));

		draw_set_halign(fa_left);
		draw_set_valign(fa_top);