if(global.paused || global.gameState == state.shop)
{
	draw_set_alpha(0.5); draw_set_colour(c_black);
	draw_rectangle(-100, -100, room_width+100, room_height+100, false);
	draw_set_alpha(1); draw_set_colour(c_white);
}