sound(snd_shoot2);
var b = instance_create_layer(x, y, "Bullets", obj_bullet);
b.sprite_index = spr_bullet_red2; 
b.exists = true;
b.speed = bspd; b.knockback = bkb; b.owner = obj_enemy;
var b1 = instance_create_layer(x, y, "Bullets", obj_bullet);
b1.sprite_index = spr_bullet_red2; 
b1.exists = true;
b1.speed = bspd; b1.knockback = bkb; b1.owner = obj_enemy;
var b2 = instance_create_layer(x, y, "Bullets", obj_bullet);
b2.sprite_index = spr_bullet_red2; 
b2.exists = true;
b2.speed = bspd; b2.knockback = bkb; b2.owner = obj_enemy;
if(instance_exists(obj_player))
{
	var d = point_direction(x, y, obj_player.x, obj_player.y)
	b.direction = d;
	b1.direction = d-20; 
	b2.direction = d+20;
}
else
{
	b.direction = down; b1.direction = down-20; b2.direction = down+20; 
}
b.image_angle = b.direction; b1.image_angle = b1.direction; b2.image_angle = b2.direction; 
event_inherited();
