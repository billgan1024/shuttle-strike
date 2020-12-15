image_angle += 4;

var e = part_type_create();
part_type_shape(e, pt_shape_smoke);
part_type_color1(e, make_colour_rgb(131, 96, 73));
part_type_alpha2(e, 1, 0);
part_type_orientation(e, 0, 359, 10, 0, false);
part_type_size(e, 0.8, 0.8, -0.08, 0);
part_type_life(e, 30, 30);
part_particles_create(global.ps_below, x, y, e, 1);

if(place_meeting(x + lengthdir_x(speed, direction), y + lengthdir_y(speed, direction), obj_player))
{
	if(!obj_player.immune)
	{
		while(!place_meeting(x + lengthdir_x(speed, direction), y + lengthdir_y(speed, direction), obj_player))
		{
			x += lengthdir_x(1, direction); y += lengthdir_y(1, direction);	
		}
		sound(snd_splat); obj_game.shake = 12; 
		with(obj_game) { effect_damage(); } global.hp--;
		if(global.combo > 0) { sound(snd_combobreak); global.combo = 0; }
		obj_player.immune = true; obj_player.alarm[3] = 180; obj_player.alarm[10] = 20;
		obj_player.canDodge = false; obj_player.alarm[2] = 180;
		obj_player.image_index = 1; obj_player.alarm[11] = 2;
		obj_player.kbSpd = knockback; obj_player.kbDir = image_angle;
		effect_create_above(ef_firework, x, y, 2, make_colour_rgb(131, 96, 73));
		instance_destroy();
	}
}