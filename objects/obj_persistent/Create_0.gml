window_set_size(display_get_gui_height()/3*4, display_get_gui_height()/4*3);
alarm[0] = 1; 
randomize();

global.ps_above = part_system_create();
part_system_depth(global.ps_above, -9999);
global.ps_below = part_system_create();
part_system_depth(global.ps_below, 750);

global.sfx = true; global.mus = true; global.paused = false;
global.enabledshop = false; 

enum state
{
	menu, options, info, game, shop, length
}
global.gameState = state.menu; global.difficulty = 0;
global.cr = 0; global.cc = 0;
global.mr = array_create(state.length, 1);
global.mc = array_create(state.length, 1);
global.mr[state.menu] = 4; global.mr[state.options] = 4;
global.mr[state.game] = 3;
global.mr[state.shop] = 4; global.mc[state.shop] = 4;

//shop descriptions
global.shop[0, 0] = "Damage Up\nDeal +5% damage (from base).";


global.time = 0; global.paused = false; 