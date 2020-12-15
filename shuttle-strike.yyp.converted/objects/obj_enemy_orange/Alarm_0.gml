sound(snd_shoot2);
var b = instance_create_layer(x, y, "Bullets", obj_bullet);
b.sprite_index = spr_bullet_orange; 
if(instance_exists(obj_player))
{
	b.direction = point_direction(x, y, obj_player.x, obj_player.y);
}
else b.direction = down; b.exists = true;
b.image_angle = b.direction;
b.speed = bspd; b.knockback = bkb; b.owner = obj_enemy;
event_inherited();
