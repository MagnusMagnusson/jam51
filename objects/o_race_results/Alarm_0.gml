if(ctrl.humanPosition <= 3){
	audio_play_sound(snd_bing, 2, false);
} else {
	audio_play_sound(snd_bong, 2, false);
}
buckets++;
alarm[1] = 0.9 * fps;