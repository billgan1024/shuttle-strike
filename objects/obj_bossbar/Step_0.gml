if(existsBoss)
{
	y = smooth_approach(y, 70, 0.1);	
	displayhp = smooth_approach(displayhp, instance_nearest(x, y, obj_boss1).hp, 0.3);
}
else
{
	y = smooth_approach(y, -70, 0.1);
	//displayhp = smooth_approach(displayhp, 0, 0.3);
}