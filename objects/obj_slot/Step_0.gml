if(global.item == 0)
{
	x = smooth_approach(x, room_width, 0.3);	
	y = smooth_approach(y, room_height, 0.3);	
}
else
{
	x = smooth_approach(x, room_width-sprite_width-20, 0.3);	
	y = smooth_approach(y, room_height-sprite_height-20, 0.3);	
}