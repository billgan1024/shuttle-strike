if(room == rm_game)
{
	global.paused = !global.paused; global.gameState = state.game; 
	if(global.paused)
	{
		sound(snd_pause); pause();
	}
	else
	{
		sound(snd_unpause); rs(); unpause();
	}
}