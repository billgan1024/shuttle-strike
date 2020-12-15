if(group == global.gameState)
{
	if(isImage)
	{
		draw_sprite(sprite, 0, x, y);	
	}
	else
	{
		draw_set_font(fnt_small);
		draw_set_halign(ha);
		draw_set_valign(va);
		draw_set_colour(c_white);
		draw_set_font(font);
		draw_text(x, y, text);
	}
}