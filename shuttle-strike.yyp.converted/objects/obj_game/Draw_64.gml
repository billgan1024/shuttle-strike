draw_set_alpha(a1);
draw_set_font(fnt_small);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(20, 20, "[Tab] Shop");
draw_set_alpha(1);
draw_set_alpha(global.alpha);
var h = sprite_get_height(spr_bar); 
var d = sprite_get_width(spr_bar)-sprite_get_width(spr_bar2);
draw_sprite(spr_bar, 0, h, room_height-h);
draw_sprite_part(spr_bar2, 0, 0, 0, 
	global.displayammo/global.maxammo*sprite_get_width(spr_bar2),
	h, h+d/2, room_height-h*2);

for(var i = 0; i < global.hp; i++)
{
	draw_sprite(spr_heart, 0, h+4+(sprite_get_width(spr_heart)+12)*i, room_height-3*h);	
}
effect_x = h+4+(sprite_get_width(spr_heart)+12)*(global.hp-1);
effect_x2 = h+4+(sprite_get_width(spr_heart)+12)*(min(global.hp, global.maxhp-1));
for(var i = global.hp; i < global.maxhp; i++)
{
	draw_sprite(spr_heart_empty, 0, h+4+(sprite_get_width(spr_heart)+12)*i, room_height-3*h);
}

draw_set_alpha(1);
draw_set_colour(c_white); draw_set_halign(fa_right); draw_set_valign(fa_top);
draw_set_font(fnt_med);
draw_text(room_width-32, 32, "Score: " + string(round(global.displaypts)));
draw_set_font(fnt_small);
draw_text(room_width-32, 120, "Combo: " + string(global.combo) + "x");