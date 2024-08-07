if (enter_pressed)
{
	timer -= (1*delta_multiplyer*target_flashing_speed);
	
	if (timer < -1)
	{
		timer = 1;
	}
	
	if (timer >= 0)
	{
		dalpha = 0;
	}
	else
	{
		dalpha = 1;
	}
}
else
{
	
}