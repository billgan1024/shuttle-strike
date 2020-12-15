var e = part_type_create();
part_type_sprite(e, spr_heart, false, false, false);
if(collided) part_type_alpha2(e, 0.4, 0); 
else part_type_alpha2(e, 1, 0);
part_type_speed(e, 5, 5, -0.2, 0); part_type_direction(e, up, up, 0, 0);
part_type_life(e, 25, 25);
part_particles_create(global.ps_above, effect_x, effect_y, e, 1);