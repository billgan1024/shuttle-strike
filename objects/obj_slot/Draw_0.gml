draw_sprite(spr_slot, 0, global.bx+x, global.by+y); var xx = x + sprite_width/2, yy = y + sprite_height/2;
if(global.item != 0)
{
	switch(global.item)
	{
		case seeker: draw_sprite_ext(spr_seeker_item, 0, global.bx+xx, global.by+yy, 1, 1, 45, c_white, 1);
		break;
		case triple: draw_sprite_ext(spr_triple, 0, global.bx+xx, global.by+yy, 1, 1, 0, c_white, 1);
		break;
	}
}