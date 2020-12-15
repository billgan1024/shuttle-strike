draw_sprite_ext(spr_jets, 0, x-30, y+33, 1, wave(0.8, 1, 0.7, 0), 0, c_white, 1);
draw_sprite_ext(spr_jets, 0, x+30, y+33, 1, wave(0.8, 1, 0.7, 0), 0, c_white, 1);
draw_self();
draw_set_halign(fa_center); draw_set_valign(fa_middle);
draw_set_colour(c_white); draw_set_font(fnt_small);
if(alarm[3] != -1 && global.debug) draw_text(x, y-sprite_height-50, "Immune: " + string(alarm[3]));