if(group == global.gameState)
{
	draw_set_font(fnt_small);
	draw_set_halign(ha);
	draw_set_valign(va);
	if(r == global.cr && c == global.cc) draw_set_colour(c_yellow);
	else draw_set_colour(c_white);
	draw_text(x, y, text);
	draw_set_colour(c_white);
}