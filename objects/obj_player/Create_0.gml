hsp = 0; vsp = 0; kbSpd = 0; kbDir = 0; spd = 10; accel = 10; bspd = 35;
key_left = 0; key_right = 0; key_up = 0; key_down = 0; particles = false;
key_z = 0; key_x = 0; key_shift = 0; canFire = false; alarm[0] = 6;
count = 0; hwidth = sprite_width/2; hheight = sprite_height/2;
regenAmmo = false; canDodge = true; immune = false; canBoost = true;
useItem = false;
enum player
{
	active,
	dash,
	length
}
playerState = player.active;

//stats of bullets
standard = 30; standardkb = 10;
seekerdmg = 100; seekerkb = 18; 
tripleShot = false;