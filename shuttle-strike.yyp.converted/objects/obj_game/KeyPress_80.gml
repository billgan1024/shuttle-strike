global.debug = !global.debug;
var e = instance_create_layer(room_width/2, room_height/10*9, "Controllers", obj_help);
e.info = global.debug ? 2 : 3; e.alarm[0] = 1;