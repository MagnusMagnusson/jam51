function time_stringtime(time){
	var minutes = string_replace(string_format(time div 60,2,0)," ","0");
	var seconds = string_replace(string_format(floor(time % 60),2,0)," ","0");
	var micro = string_replace(string_format(100 * frac(time),2,0)," ","0");
	return string("{0}:{1}.{2}", minutes, seconds, micro);
}