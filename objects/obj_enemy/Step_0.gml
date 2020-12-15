switch(enemyState)
{
	case enemy.enter:
		y = smooth_approach(y, sprite_height*3/2, 0.05);
		if(y >= sprite_height) enemyState = enemy.active;
	break;
	case enemy.active:
		x += hsp; y += vsp;
		x += lengthdir_x(kbSpd, kbDir); y += lengthdir_y(kbSpd, kbDir);
	break;
}

if(place_meeting(x, y, obj_player))
{
	if(!obj_player.immune)
	{
		sound(snd_hit); obj_game.shake = 12; 
		with(obj_game) { effect_damage(); } global.hp--;
		if(global.combo > 0) { sound(snd_combobreak); global.combo = 0; }
		obj_player.immune = true; obj_player.alarm[3] = 180; obj_player.alarm[10] = 20;
		obj_player.canDodge = false; obj_player.alarm[2] = 180;
		obj_player.image_index = 1; obj_player.alarm[11] = 2;
		obj_player.kbSpd = 30; obj_player.kbDir = point_direction(x, y, obj_player.x, obj_player.y);
	}
}

kbSpd = approach(kbSpd, 0, 2);

if(hp <= 0)
{
	audio_stop_sound(snd_hit2); sound(snd_explosion); obj_game.shake = 12;
	var e = instance_create_layer(x, y, "Effects", obj_effect);
	e.sprite_index = effect; 
	var pts = points + 4*(global.combo)*giveCombo;
	global.pts += pts; 
	var t = instance_create_layer(x, y-sprite_height/4, "Effects2", obj_texteffect);
	t.text = "+" + string(pts) global.combo++;
	if(drop != -1) 
	{
		switch(drop)
		{
			case healthpack: instance_create_layer(x, y, "Enemies", item_hp);
			break;
			
			case seeker: instance_create_layer(x, y, "Enemies", item_seeker);
			break;
			
			case triple: instance_create_layer(x, y, "Enemies", item_triple);
			break;
		}
	}
	instance_destroy();	
}

if(y >= room_height+sprite_height/2)
{
	audio_stop_sound(snd_hit2); sound(snd_explosion); obj_game.shake = 12;
	var e = instance_create_layer(x, y, "Effects", obj_effect);
	e.sprite_index = effect; 
	if(global.combo > 0) { sound(snd_combobreak); global.combo = 0; }
	instance_destroy();	
}