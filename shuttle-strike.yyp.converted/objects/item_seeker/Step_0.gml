if(y >= room_height+sprite_height/2) instance_destroy();
if(place_meeting(x, y + vsp, obj_player))
{
	while(!place_meeting(x, y + sign(vsp), obj_player))
	{
		y += sign(vsp);	
	}
	sound(snd_item);
	var e = part_type_create();
	part_type_shape(e, pt_shape_ring); part_type_colour1(e, make_colour_rgb(29, 141, 146));
	part_type_alpha2(e, 1, 0);
	part_type_size(e, 1.2, 1.2, 0.1, 0);
	part_type_life(e, 15, 15);
	part_particles_create(global.ps_above, x, y, e, 1);
	
	if(global.item != 0)
	{
		var t = instance_create_layer(x, y-sprite_height/4, "Effects2", obj_texteffect);
		t.text = "+100"; global.pts += 100;
	}
	else
	{
		global.item = seeker;
		var e = part_type_create();
		part_type_sprite(e, spr_seeker, false, false, false);
		part_type_orientation(e, 45, 45, 0, 0, false);
		part_type_alpha2(e, 1, 0);
		part_type_speed(e, 5, 5, -0.2, 0); part_type_direction(e, up, up, 0, 0);
		part_type_life(e, 25, 25);
		part_particles_create(global.ps_above, x, y, e, 1);
	}
	if(global.tip0)
	{
		var e = instance_create_layer(room_width/2, room_height/4*3, "Controllers", obj_help);
		e.info = 1; e.alarm[0] = 120;
		global.tip0 = false;
	}
	instance_destroy();
}
vsp = approach(vsp, maxGrav, grav);
y += vsp;