get_input();
switch(playerState)
{
	case player.active:
		if(key_x && canFire)
		{
			if(global.ammo > 0)
			{
				regenAmmo = false; alarm[1] = 30;
				global.ammo = max(global.ammo-2, 0);
				audio_sound_pitch(snd_shoot, random_range(0.98, 1.02)); sound(snd_shoot); count++;
				if(tripleShot)
				{
					var b0 = instance_create_layer(x, y, "Bullets", obj_bullet);
					b0.speed = bspd; b0.direction = up; b0.image_angle = b0.direction;
					b0.owner = obj_player; b0.dmg = standard; b0.knockback = standardkb; 
					
					var b1 = instance_create_layer(x, y, "Bullets", obj_bullet);
					b1.speed = bspd; b1.direction = up-12; b1.image_angle = b1.direction;
					b1.owner = obj_player; b1.dmg = standard; b1.knockback = standardkb; 
					
					var b2 = instance_create_layer(x, y, "Bullets", obj_bullet);
					b2.speed = bspd; b2.direction = up+12; b2.image_angle = b2.direction;
					b2.owner = obj_player; b2.dmg = standard; b2.knockback = standardkb; 
				}
				else
				{
					var b = instance_create_layer(x+(count%2 == 0 ? -10 : 10), y, "Bullets", obj_bullet);
					b.speed = bspd; b.direction = up; b.image_angle = b.direction;
					b.owner = obj_player; b.dmg = standard; b.knockback = standardkb; 	
				}
				canFire = false; 
				if(global.ammo == 0) alarm[0] = 85; else alarm[0] = 6;	
			}
		}
		if(key_z)
		{
			if(canDodge)
			{
				sound(snd_dodge);
				var e = part_type_create();
				part_type_sprite(e, spr_dodge, true, true, false);
				part_type_alpha3(e, 1, 1, 0);
				part_type_size(e, 1, 1, 0.12, 0);
				part_type_life(e, 8, 8);
				part_particles_create(global.ps_above, x, y, e, 1);
				immune = true; alarm[3] = 15; spd = 0; alarm[4] = 12;
				canDodge = false; alarm[2] = 120; 
				canBoost = false; alarm[5] = 15;
			}
		}
		
		if(key_shift)
		{
			if(canBoost)
			{
				sound(snd_boost); 
				canBoost = false; alarm[5] = 20; canDodge = false; alarm[2] = 20; 
				canFire = false; alarm[0] = 20;
				var h = key_right-key_left; var v = key_down-key_up;
				kbSpd = 35; particles = true; alarm[6] = 15;
				if(h == 0 && v == 0) kbDir = up;
				else kbDir = point_direction(0, 0, h, v);
			}
		}
		hsp = approach(hsp, (key_right-key_left)*spd, accel);
		vsp = approach(vsp, (key_down-key_up)*spd, accel);
	break;
}

if(particles) 
{
	var e = part_type_create();
	part_type_shape(e, pt_shape_smoke);
	part_type_color2(e, c_orange, c_yellow);
	part_type_alpha2(e, 1, 0);
	part_type_orientation(e, 0, 359, 10, 0, false);
	part_type_size(e, 0.8, 0.8, -0.08, 0);
	part_type_life(e, 30, 30);
	part_particles_create(global.ps_below, x, y, e, 1);
}

if(global.hp == 0)
{
	instance_destroy();	sound(snd_explosion); sound(snd_fail);
	var e = instance_create_layer(x, y, "Effects", obj_effect);
	e.sprite_index = spr_explosion; 
}

if(regenAmmo) global.ammo = min(global.ammo+2, global.maxammo);

x += hsp; y += vsp;
kbSpd = approach(kbSpd, 0, 2);
x += lengthdir_x(kbSpd, kbDir); y += lengthdir_y(kbSpd, kbDir);

x = clamp(x, 0+hwidth, room_width-hwidth);
y = clamp(y, 0+hheight, room_height-hheight);