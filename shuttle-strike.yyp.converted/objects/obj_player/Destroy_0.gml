with(obj_texteffect2) instance_destroy();
var e = instance_create_layer(room_width/2, room_height/4, "Controllers", obj_texteffect2);
e.fade = false; e.text = "Game Over!";

var e1 = instance_create_layer(room_width/2, room_height/4*3, "Controllers", obj_texteffect2);
e1.fade = false; e1.font = fnt_small; e1.text = "R: Restart";
