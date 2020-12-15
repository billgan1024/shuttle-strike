draw_set_halign(fa_center); draw_set_valign(fa_middle);
draw_set_alpha(alpha); draw_set_font(font);
switch(info)
{
	case 0: draw_text(x, y, "Arrow Keys: Move\nX: Shoot\nShift: Boost\nEsc: Pause");
	break;
	
	case 1: draw_text(x, y, "Double tap Space: Use item");
	break;
	
	case 2: draw_text(x, y, "Debug mode enabled.");
	break;
	
	case 3: draw_text(x, y, "Debug mode disabled.");
	break;
	
	case 4: draw_text(x, y, "Shop is unlocked! Press Tab to open it.");
	break;
}
draw_set_alpha(1);