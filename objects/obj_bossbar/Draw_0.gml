var h = sprite_get_height(spr_bar); var w = sprite_get_width(spr_bar);
var d = sprite_get_width(spr_bar)-sprite_get_width(spr_bar2);
draw_sprite(spr_bar, 0, x-w/2+h, y);

draw_sprite_part(spr_bar3, 0, 0, 0, 
	displayhp/global.maxbosshp*sprite_get_width(spr_bar2),
	h, global.bx+x-w/2+h+d/2, global.by+y-h);

draw_set_colour(c_white); draw_set_font(fnt_small);
draw_set_halign(fa_center); draw_set_valign(fa_middle);
draw_text(global.bx+x, global.by+y - 35, bossName);