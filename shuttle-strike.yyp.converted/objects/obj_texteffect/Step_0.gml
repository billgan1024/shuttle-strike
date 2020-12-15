if(vspeed < 0)
{
	vspeed += 0.06;
	alpha -= 0.06;
}
else
{
	instance_destroy();	
}