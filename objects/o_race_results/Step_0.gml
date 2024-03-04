blindTimer += 1/60;
positionTimer += 1/60;
blindTimer = min(blindTimer,1);

if(Input().getButtonPressed(Input_Actions.Confirm))
{
	global.skipToLevelSelect = true;
	room_goto(rm_main_menu);
}