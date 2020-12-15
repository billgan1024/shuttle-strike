draw_set_halign(fa_center); draw_set_valign(fa_middle);
draw_set_font(fnt_small); draw_set_colour(c_white);
draw_self();
if(global.debug) draw_text(x, y-sprite_height/2-50, "HP: " + string(hp));