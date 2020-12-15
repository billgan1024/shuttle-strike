var e = part_type_create();
part_type_shape(e, pt_shape_ring); part_type_colour1(e, c_red);
if(collided) part_type_alpha2(e, 0.4, 0); 
else part_type_alpha2(e, 1, 0);
part_type_size(e, 0.8, 0.8, 0.05, 0);
part_type_life(e, 15, 15);
part_particles_create(global.ps_above, effect_x2+sprite_get_width(spr_heart)/2, effect_y-sprite_get_width(spr_heart)/2, e, 1);