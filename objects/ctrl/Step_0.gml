countdown -= 1/60;
messageTimer -= 1/60
if(countdown <= 0){
	with(o_car){
		timer += 1/60;
	}
}

if(countdown <= 0 && countdown + 1/60 > 0){
	message = "DRIVE!";
	messageTimer = 1;
	audio_play_sound(snd_beep_start, 6,false);
}

if(countdown <= 3 && countdown > 0 && floor(countdown + 1/60) > floor(countdown)){
	audio_play_sound(snd_beep, 6,false);
}
