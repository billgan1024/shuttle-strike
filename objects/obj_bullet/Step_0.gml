direction = image_angle;
if(owner == obj_player)
{
	if(place_meeting(x + lengthdir_x(speed, direction), y + lengthdir_y(speed, direction), obj_enemy))
	{
		var o = instance_nearest(x + lengthdir_x(speed, direction), y + lengthdir_y(speed, direction), obj_enemy);
		if(!o.immune)
		{
			while(!place_meeting(x + lengthdir_x(1, direction), y + lengthdir_y(1, direction), obj_enemy))
			{
				x += lengthdir_x(1, direction); y += lengthdir_y(1, direction);	
			}
				o.hp -= dmg; o.immune = true; o.image_index = 1;
				o.alarm[11] = 2; o.alarm[10] = 5;
				o.kbSpd = knockback; o.kbDir = image_angle;
		
			sound(snd_hit2); 
			var e = instance_create_layer(x, y, "Effects", obj_effect);
			switch(sprite_index)
			{
				case spr_bullet_blue: e.sprite_index = spr_impact_blue;
				break;
			}
			e.image_angle = image_angle;
			instance_destroy();
		}
	}
}
else if(owner == obj_enemy)
{
	if(place_meeting(x + lengthdir_x(speed, direction), y + lengthdir_y(speed, direction), obj_player))
	{
		if(!obj_player.immune)
		{
			while(!place_meeting(x + lengthdir_x(speed, direction), y + lengthdir_y(speed, direction), obj_player))
			{
				x += lengthdir_x(1, direction); y += lengthdir_y(1, direction);	
			}
			sound(snd_hit); obj_game.shake = 12; 
			with(obj_game) { effect_damage(); } global.hp--;
			if(global.combo > 0) { sound(snd_combobreak); global.combo = 0; }
			obj_player.immune = true; obj_player.alarm[3] = 180; obj_player.alarm[10] = 20;
			obj_player.canDodge = false; obj_player.alarm[2] = 180;
			obj_player.image_index = 1; obj_player.alarm[11] = 2;
			obj_player.kbSpd = knockback; obj_player.kbDir = image_angle;
			var e = instance_create_layer(x, y, "Effects", obj_effect);
			switch(sprite_index)
			{
				case spr_bullet_green: e.sprite_index = spr_impact_green;
				break;
				
				case spr_bullet_red: e.sprite_index = spr_impact_red;
				break;
				
				case spr_bullet_orange: e.sprite_index = spr_impact_orange;
				break;
			}
			e.image_angle = image_angle;
			instance_destroy();
		}
	}
}