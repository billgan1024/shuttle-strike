if(global.enabledshop && !global.paused)
{
	if(global.gameState != state.shop)
	{
		sound(snd_pause); pause(); global.gameState = state.shop;
	}
	else 
	{ 
		sound(snd_unpause); rs(); unpause(); global.gameState = state.game; 
	}
}