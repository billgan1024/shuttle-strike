if(instance_exists(obj_player)) direction = point_direction(x, y, obj_player.x, obj_player.y) + random_range(-10, 10);
else direction = random_range(down-30, down+30);
speed = random_range(18, 20); image_index = choose(0, 1, 2, 3);
sound(snd_launch); knockback = 15; 