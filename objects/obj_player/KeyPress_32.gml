if(useItem)
{
	useItem = false; alarm[7] = -1;
	switch(global.item)
	{
		case seeker: sound(snd_launch);
		var b = instance_create_layer(x, y, "Bullets", obj_seeker);
		b.owner = obj_player; b.speed = 20; b.direction = up; b.image_angle = b.direction;
		b.dmg = seekerdmg; b.knockback = seekerkb;
		break;
		
		case triple: sound(snd_use);
		tripleShot = true; alarm[8] = 180;
		var e = part_type_create();
		part_type_shape(e, pt_shape_ring);
		part_type_colour1(e, make_colour_rgb(102, 178, 255));
		part_type_alpha2(e, 1, 0);
		part_type_size(e, 0, 0, 0.5, 0);
		part_type_life(e, 10, 10);
		part_particles_create(global.ps_above, x, y, e, 1);
		break;
	}
	global.item = 0;
}
else
{
	useItem = true; alarm[7] = 15;
}