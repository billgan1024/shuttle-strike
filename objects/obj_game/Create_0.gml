audio_stop_sound(mus_game); audio_stop_sound(mus_menu); music(mus_game);
shake = 0; global.alpha = 1; effect_x = 0; effect_x2 = 0; 
effect_y = room_height-3*sprite_get_height(spr_bar); collided = false; a1 = 0;

recent = 7900;

global.hp = 3; global.maxhp = 3;
global.displayammo = 0; global.ammo = 100; global.maxammo = 100;
global.displaypts = 0; global.pts = 0;
global.combo = 0; global.item = 0; global.tip0 = true;
global.debug = false;

global.hpmod = 1; global.bspdmod = 1; global.fireratemod = 1;
global.asteroidmod = 1; global.maxbosshp = 1000;

time = 0;
//initialize enemy spawns here
for(var i = 0; i < 10800; i++) 
{ 
	spawn[i, 0] = -1; spawn[i, 1] = room_width/2; 
	spawn[i, 2] = -100; spawn[i, 3] = 1; spawn[i, 4] = -1;
}
switch(global.difficulty)
{
	case 0: 
		spawn[0, 0] = help; spawn[0, 1] = room_width/2; spawn[0, 2] = room_height/4*3; spawn[0, 3] = 0;
		spawn[60, 0] = newstage; spawn[60, 1] = 0; spawn[60, 3] = 1;
		spawn[180, 0] = green; spawn[180, 3] = 0; spawn[180, 1] = room_width/2;
		//spawn[181, 0] = green; spawn[181, 3] = 0; spawn[181, 1] = room_width/2-100;
		//spawn[200, 0] = triple;
		spawn[360, 0] = green;
		spawn[540, 0] = green;
		spawn[600, 0] = enemypause;
		
		spawn[720, 0] = newstage; spawn[720, 1] = 0; spawn[720, 3] = 2;
		spawn[900, 0] = green;
		spawn[1080, 0] = green;
		spawn[1260, 0] = green;
		spawn[1440, 0] = green;
		spawn[1500, 0] = enemypause;
		
		spawn[1620, 0] = newstage; spawn[1620, 1] = 0; spawn[1620, 3] = 3;
		spawn[1800, 0] = green;
		spawn[1980, 0] = green;
		spawn[2160, 0] = orange;
		spawn[2340, 0] = orange;
		spawn[2460, 0] = healthpack;
		spawn[2500, 0] = enemypause;
		
		spawn[2620, 0] = newstage; spawn[2620, 1] = 0; spawn[2620, 3] = 4;
		spawn[2800, 0] = orange;
		spawn[2920, 0] = orange;
		spawn[3040, 0] = orange;
		spawn[3160, 0] = green;
		spawn[3280, 0] = green;
		spawn[3400, 0] = orange;
		spawn[3520, 0] = orange;
		spawn[3640, 0] = orange;
		spawn[3780, 0] = enemypause;
		
		spawn[3840, 0] = newstage; spawn[3840, 1] = 0; spawn[3840, 3] = 5;
		spawn[3960, 0] = green;
		spawn[4020, 0] = green;
		spawn[4140, 0] = black;
		spawn[4320, 0] = black;
		spawn[4500, 0] = orange;
		spawn[4620, 0] = healthpack;
		spawn[4680, 0] = green;
		spawn[4740, 0] = green;
		spawn[4860, 0] = black;
		spawn[4980, 0] = seeker;
		spawn[5000, 0] = enemypause;
		
		spawn[5060, 0] = newstage; spawn[5060, 1] = 0; spawn[5060, 3] = 6;
		spawn[5180, 0] = green; spawn[5180, 1] = room_width/2; spawn[5180, 3] = 0;
		spawn[5280, 0] = green; spawn[5280, 1] = room_width/2-200; spawn[5280, 3] = 0;
		spawn[5380, 0] = green; spawn[5380, 1] = room_width/2+200; spawn[5380, 3] = 0;
		spawn[5480, 0] = black; 
		spawn[5600, 0] = black; 
		spawn[5800, 0] = green; spawn[5800, 1] = room_width/2-400; spawn[5800, 3] = 0;
		spawn[5900, 0] = green; spawn[5900, 1] = room_width/2+400; spawn[5900, 3] = 0;
		spawn[6100, 0] = asteroid;
		spawn[6150, 0] = asteroid;
		spawn[6175, 0] = green; 
		spawn[6200, 0] = asteroid;
		spawn[6250, 0] = asteroid;
		spawn[6300, 0] = asteroid;
		spawn[6325, 0] = green; 
		spawn[6350, 0] = asteroid;
		spawn[6400, 0] = black; 
		spawn[6500, 0] = black; 
		spawn[6600, 0] = healthpack; 
		spawn[6700, 0] = triple; 
		spawn[6710, 0] = enemypause;
		
		
		spawn[6770, 0] = newstage; spawn[6770, 1] = 0; spawn[6770, 3] = 7;
		spawn[6890, 0] = orange; 
		spawn[7000, 0] = orange; 
		spawn[7100, 0] = black; 
		spawn[7200, 0] = black; 
		spawn[7300, 0] = black; 
		spawn[7400, 0] = black; 
		spawn[7570, 0] = asteroid;
		spawn[7600, 0] = asteroid;
		spawn[7630, 0] = asteroid;
		spawn[7660, 0] = asteroid;
		spawn[7690, 0] = asteroid;
		spawn[7695, 0] = healthpack; 
		spawn[7700, 0] = enemypause;
		
		//spawn[7759, 0] = ebspd; spawn[7759, 3] = 1.05;
		spawn[7760, 0] = newstage; spawn[7760, 1] = 1; spawn[7760, 3] = 8;
		spawn[7880, 0] = boss1; spawn[7880, 3] = 0; spawn[7880, 4] = healthpack;
		spawn[7900, 0] = enemypause;
		spawn[7901, 0] = enableshop;
		

		spawn[8000, 0] = newstage; spawn[8000, 1] = 0; spawn[8000, 3] = 9;
		spawn[8001, 0] = help; spawn[8001, 1] = room_width/2; spawn[8001, 2] = room_height/4*3; spawn[8001, 3] = 4;
		spawn[8119, 0] = disableshop;
		spawn[8120, 0] = green2;
		spawn[8240, 0] = green2;
		spawn[8360, 0] = green2;
		spawn[7100, 0] = black; 
		spawn[7200, 0] = black; 
	break;
	
}