hsp = 0; vsp = 0; kbSpd = 0; kbDir = 0;
immune = true; alarm[10] = 15; hp = 100; points = 0;
effect = spr_explosion; giveCombo = 1; drop = -1;
fireRate = 60; bspd = 20*global.bspdmod; bkb = 10; alarm[0] = random_range(1, fireRate-1);
direction = image_angle + 270;
enum enemy
{
	enter,
	active
}
enemyState = enemy.enter;