shake = approach(shake, 0, 0.6);
camera_set_view_pos(view_camera[0], random_range(-shake, shake), random_range(-shake, shake));
global.displayammo = smooth_approach(global.displayammo, global.ammo, 0.3);
global.displaypts = smooth_approach(global.displaypts, global.pts, 0.4);

if(spawn[time, 0] != -1)
{
	switch(spawn[time, 0])
	{
		case green: 
			var w = sprite_get_width(spr_enemy_green)/2;
			if(spawn[time, 3] == 1) 
			{
				var en = instance_create_layer(random_range(w, room_width-w), spawn[time, 2], "Enemies", obj_enemy_green);
				en.drop = spawn[time, 4];
			}
			else
			{
				var en = instance_create_layer(spawn[time, 1], spawn[time, 2], "Enemies", obj_enemy_green);	
				en.drop = spawn[time, 4];
			}
		break;
		
		case green2: 
			var w = sprite_get_width(spr_enemy_green2)/2;
			if(spawn[time, 3] == 1) 
			{
				var en = instance_create_layer(random_range(w, room_width-w), spawn[time, 2], "Enemies", obj_enemy_green2);
				en.drop = spawn[time, 4];
			}
			else
			{
				var en = instance_create_layer(spawn[time, 1], spawn[time, 2], "Enemies", obj_enemy_green2);	
				en.drop = spawn[time, 4];
			}
		break;
		
		case orange: 
			var w = sprite_get_width(spr_enemy_orange)/2;
			if(spawn[time, 3] == 1) 
			{
				var en = instance_create_layer(random_range(w, room_width-w), spawn[time, 2], "Enemies", obj_enemy_orange);
				en.drop = spawn[time, 4];
			}
			else
			{
				var en = instance_create_layer(spawn[time, 1], spawn[time, 2], "Enemies", obj_enemy_orange);	
				en.drop = spawn[time, 4];
			}
		break;
		
		case black: 
			var w = sprite_get_width(spr_enemy_black)/2;
			if(spawn[time, 3] == 1) 
			{
				var en = instance_create_layer(random_range(w, room_width-w), spawn[time, 2], "Enemies", obj_enemy_black);
				en.drop = spawn[time, 4];
			}
			else
			{
				var en = instance_create_layer(spawn[time, 1], spawn[time, 2], "Enemies", obj_enemy_black);	
				en.drop = spawn[time, 4];
			}
		break;
		
		case boss1: 
			var w = sprite_get_width(spr_boss1)/2;
			if(spawn[time, 3] == 1) 
			{
				var en = instance_create_layer(random_range(w, room_width-w), spawn[time, 2], "Enemies", obj_boss1);
				en.drop = spawn[time, 4];
			}
			else
			{
				var en = instance_create_layer(spawn[time, 1], spawn[time, 2], "Enemies", obj_boss1);
				en.drop = spawn[time, 4];
			}
		break;
		
		case asteroid: 
			if(spawn[time, 3] == 1) 
			{
				instance_create_layer(random_range(room_width/2-800, room_width/2+800), spawn[time, 2], "Enemies", obj_asteroid);
			}
			else
			{
				instance_create_layer(spawn[time, 1], spawn[time, 2], "Enemies", obj_asteroid);	
			}
		break;
		
		case healthpack:
			var w = sprite_get_width(spr_item_healthpack)/2; var h = sprite_get_height(spr_item_healthpack)/2;
			if(spawn[time, 3] == 1) 
			{
				instance_create_layer(random_range(w, room_width-w), -h, "Enemies", item_hp);
			}
			else
			{
				instance_create_layer(spawn[time, 1], spawn[time, 2], "Enemies", item_hp);	
			}
		break;
		
		case seeker:
			var w = sprite_get_width(spr_item_seeker)/2; var h = sprite_get_height(spr_item_seeker)/2;
			if(spawn[time, 3] == 1) 
			{
				instance_create_layer(random_range(w, room_width-w), -h, "Enemies", item_seeker);
			}
			else
			{
				instance_create_layer(spawn[time, 1], spawn[time, 2], "Enemies", item_seeker);	
			}
		break;
		
		case triple:
			var w = sprite_get_width(spr_item_triple)/2; var h = sprite_get_height(spr_item_triple)/2;
			if(spawn[time, 3] == 1) 
			{
				instance_create_layer(random_range(w, room_width-w), -h, "Enemies", item_triple);
			}
			else
			{
				instance_create_layer(spawn[time, 1], spawn[time, 2], "Enemies", item_triple);	
			}
		break;
		
		case newstage:
			sound(snd_stage);
			var e = instance_create_layer(room_width/2, room_height/4, "Controllers", obj_texteffect2);
			e.boss = spawn[time, 1];
			e.stage = spawn[time, 3];
		break;
		
		case enemypause:
			instance_create_layer(spawn[time, 1], spawn[time, 2], "Controllers", obj_enemypause);
			time++;
		break;
		
		case help:
			var e = instance_create_layer(spawn[time, 1], spawn[time, 2], "Controllers", obj_help);
			e.info = spawn[time, 3];
		break;
		
		case ebspd:
			global.bspdmod = spawn[time, 3];
		break;
		
		case enableshop: global.enabledshop = true;
		break;
		
		case disableshop: global.enabledshop = false;
		break;
	}
}

if(instance_exists(obj_player) && !instance_exists(obj_enemypause)) 
{
	time += 1;
}

if(instance_exists(obj_player))
{
	with(obj_player)
	{
		if(place_meeting(x, y, obj_gui)) 
		{
			with(obj_game) collided = true;
		}
		else with(obj_game) collided = false;
	}
}
else collided = false;

if(global.enabledshop) a1 = approach(a1, 1, 0.1);
else a1 = approach(a1, 0, 0.2);

if(collided) global.alpha = approach(global.alpha, 0.4, 0.2);
else global.alpha = approach(global.alpha, 1, 0.2);