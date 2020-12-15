draw_set_halign(fa_center); draw_set_valign(fa_middle);
draw_set_alpha(alpha); draw_set_font(font);
if(text == "")
{
	draw_text(x, y, "Stage " + string(stage));
	if(boss)
	{
		draw_set_font(fnt_small);
		draw_text(x, y+100, "Boss Incoming!");
	}
}
else draw_text(x, y, text);
draw_set_alpha(1);