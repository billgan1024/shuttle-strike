sound(snd_shoot2);
var b = instance_create_layer(x, y, "Bullets", obj_bullet);
b.sprite_index = spr_bullet_red; 
b.direction = direction; b.image_angle = b.direction;  b.exists = true;
b.speed = bspd; b.knockback = bkb; b.owner = obj_enemy;
event_inherited();
