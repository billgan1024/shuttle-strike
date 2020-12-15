if(!global.paused) global.time += 1/60;
if(global.cr < 0) global.cr = global.mr[global.gameState] - 1;
if(global.cr >= global.mr[global.gameState]) rs();

if(global.cc < 0) global.cc = global.mc[global.gameState] - 1;
if(global.cc >= global.mc[global.gameState]) global.cc = 0;

global.bx = camera_get_view_x(view_camera[0]);
global.by = camera_get_view_y(view_camera[0]);

if(global.gameState != state.game || global.paused)
{
	if(keyboard_check_pressed(vk_left)) { sound(snd_blip); global.cc--; }
	if(keyboard_check_pressed(vk_right)) { sound(snd_blip); global.cc++; }
	if(keyboard_check_pressed(vk_up)) { sound(snd_blip); global.cr--; }
	if(keyboard_check_pressed(vk_down)) { sound(snd_blip); global.cr++; }
	
	if(keyboard_check_pressed(vk_escape))
	{
		sound(snd_blip);
		switch(global.gameState)
		{
			case state.options:
			global.gameState = state.menu; rs();
			break;
		}
	}
	
	if(keyboard_check_pressed(vk_enter))
	{
		sound(snd_blip);
		switch(global.gameState)
		{
			case state.menu:
			switch(global.cr)
			{
				case 0: global.gameState = state.game; room_goto(rm_game);
				break;
				
				case 2: global.gameState = state.options; rs();
				break;
				
				case 3: game_end();
				break;
			}
			break;
			case state.options:
			switch(global.cr)
			{
				case 0: window_set_fullscreen(!window_get_fullscreen());
				break;
				
				case 1: global.sfx = !global.sfx;
				break;
				
				case 2: global.mus = !global.mus;
				if(global.mus) music(mus_menu);
				else audio_stop_sound(mus_menu);
				break;
				
				case 3: global.gameState = state.menu; rs();
				break;
			}
			break;
			case state.game:
			switch(global.cr)
			{
				case 0: rs(); global.paused = false; unpause(); 
				break;
				
				case 1: rs(); global.paused = false; unpause(); room_restart();
				break;
				
				case 2:  rs(); global.paused = false; unpause(); global.gameState = state.menu; room_goto(rm_menu);
				break;
			}
			break;
			
			case state.shop:
				switch(global.cr)
				{	
					case 3:
					sound(snd_unpause); rs(); unpause(); global.gameState = state.game; 
					break;
				}
			break;
		}
	}
}