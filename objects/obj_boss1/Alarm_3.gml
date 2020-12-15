var w = sprite_get_width(obj_boss1);
dx = choose(random_range(x - 8*w, x - 4*w), random_range(x + 4*w, x + 8*w));
if(dx < w/2) dx = random_range(room_width/2, room_width*3/4);
else if(dx > room_width-w/2) dx = random_range(room_width/4, room_width/2);
if(hp < global.maxbosshp/2) alarm[3] = random_range(150, 200);
else alarm[3] = random_range(250, 300);
