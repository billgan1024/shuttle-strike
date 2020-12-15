image_angle = direction;
if(owner == obj_player)
{
	if(target != -1)
	{
		if(instance_exists(target))
		{
			direction = angle_approach(direction, point_direction(x, y, target.x, target.y), 5);
		}
		else target = -1;
	}
	else
	{
		if(instance_exists(obj_enemy))
		{
			target = instance_nearest(x+lengthdir_x(sprite_width, direction), y+ + lengthdir_y(sprite_width, direction), obj_enemy);
		}
	}
}

if(place_meeting(x + lengthdir_x(speed, direction), y, obj_enemy))
{
	var o = instance_nearest(x + lengthdir_x(speed, direction), y + lengthdir_y(speed, direction), obj_enemy);
	if(!o.immune)
	{
		while(!place_meeting(x + lengthdir_x(1, direction), y + lengthdir_y(1, direction), obj_enemy))
		{
			x += lengthdir_x(1, direction); y += lengthdir_y(1, direction);	
		}
		var xx = x, yy = y, r = radius, d = dmg, k = knockback, i = image_angle;
		with(obj_enemy)
		{
			if(point_distance(x, y, xx, yy) <= r)
			{
				hp -= d; immune = true; image_index = 1;
				alarm[11] = 2; alarm[10] = 5;
				kbSpd = k; kbDir = i;
			}
		}
		
		sound(snd_explosion2); obj_game.shake = 12;
		var e = instance_create_layer(x, y, "Effects", obj_effect); 
		e.sprite_index = spr_explosion;
		instance_destroy();
	}
}
var w = sprite_width/2;
if(particles) effect_create_above(ef_smoke, x-lengthdir_x(w, direction), y-lengthdir_y(w, direction), 0, c_gray);