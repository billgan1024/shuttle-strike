tripleShot = false; sound(snd_end);
var e = part_type_create();
part_type_shape(e, pt_shape_ring);
part_type_colour1(e, make_colour_rgb(102, 178, 255));
part_type_alpha2(e, 1, 0);
part_type_size(e, 0, 0, 0.5, 0);
part_type_life(e, 10, 10);
part_particles_create(global.ps_above, x, y, e, 1);