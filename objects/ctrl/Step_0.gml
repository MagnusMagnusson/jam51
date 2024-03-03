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
}
