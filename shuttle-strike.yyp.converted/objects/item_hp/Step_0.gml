if(y >= room_height+sprite_height/2) instance_destroy();
if(place_meeting(x, y + vsp, obj_player))
{
	while(!place_meeting(x, y + sign(vsp), obj_player))
	{
		y += sign(vsp);	
	}
	sound(snd_item);
	if(global.hp != global.maxhp)
	{
		with(obj_game) effect_heal();
		var h = sprite_get_height(spr_heart); var w = sprite_get_width(spr_heart);
		global.hp++;
		var e = part_type_create();
		part_type_sprite(e, spr_heart, false, false, false);
		part_type_alpha2(e, 1, 0);
		part_type_speed(e, 5, 5, -0.2, 0); part_type_direction(e, up, up, 0, 0);
		part_type_life(e, 25, 25);
		part_particles_create(global.ps_above, x-w/2, y+h/2, e, 1);
	
		e = part_type_create();
		part_type_shape(e, pt_shape_ring); part_type_colour1(e, c_red);
		part_type_alpha2(e, 1, 0);
		part_type_size(e, 1.2, 1.2, 0.1, 0);
		part_type_life(e, 15, 15);
		part_particles_create(global.ps_above, x, y, e, 1);
	}
	else
	{
		var e = part_type_create();
		part_type_shape(e, pt_shape_ring); part_type_colour1(e, c_red);
		part_type_alpha2(e, 1, 0);
		part_type_size(e, 1.2, 1.2, 0.1, 0);
		part_type_life(e, 15, 15);
		part_particles_create(global.ps_above, x, y, e, 1);
		
		var t = instance_create_layer(x, y-sprite_height/4, "Effects2", obj_texteffect);
		t.text = "+100"; global.pts += 100;
	}
	instance_destroy();
}
vsp = approach(vsp, maxGrav, grav);
y += vsp;