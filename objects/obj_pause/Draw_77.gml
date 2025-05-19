//gpu_set_blendenable(false);
if (gamePause)
{
    instance_deactivate_all(true);
	instance_activate_object(obj_pause); 
	instance_activate_object(obj_game_controller);
}
else {
    instance_activate_all();
}

/*if (gamePause)
{
	surface_set_target(application_surface);
	if (surface_exists(pauseSurf)) draw_surface(pauseSurf, 0, 0);
	else
	{
		pauseSurf = surface_create(resW, resH);
		buffer_set_surface(pauseSurfBuffer, pauseSurf, 0);
	}
	surface_reset_target();
}

if (global._pause)
{
	if (!gamePause)
	{
		gamePause = true;
		
		instance_deactivate_all(true);
		instance_activate_object(obj_pause); 
		instance_activate_object(obj_menu); 
		instance_activate_object(obj_game_controller);
		
		instance_create_layer(x, y, "Instances", obj_menu);
		
		pauseSurf = surface_create(resW, resH);
		surface_set_target(pauseSurf);
		draw_surface(application_surface, 0, 0);
		surface_reset_target();
		
		if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
		pauseSurfBuffer = buffer_create(resW * resH * 4, buffer_fixed, 1);
		buffer_get_surface(pauseSurfBuffer, pauseSurf, 0);
	}
	else
	{
		gamePause = false;
		instance_activate_all();
		if (surface_exists(pauseSurf)) surface_free(pauseSurf);
		if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
	}
	
}

gpu_set_blendenable(true);*/