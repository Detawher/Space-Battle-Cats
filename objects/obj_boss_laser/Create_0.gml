// Inherit the parent event
event_inherited();

sprites = [
	[spr_boss_laser_pre],
	[spr_boss_laser_loop],
	[spr_boss_laser_end]
]

estado_start = function()
{
	if (estado_txt != "start")
	{
		sprites_index = 0;
		sprite_index  = spr_boss_laser_pre;
		estado_txt    = "start";
	}
	ajusta_sprite(sprites_index);
	
	if(image_ind + image_spd >= image_numb)
	{
		troquei = false;
		estado = estado_loop;
	}
}

estado_loop = function()
{
	if (estado_txt != "loop")
	{
		timer         = 60*3;
		sprites_index = 1;
		sprite_index  = spr_boss_laser_loop;
		estado_txt    = "loop";
	}
	ajusta_sprite(sprites_index);
	
	if (instance_exists(obj_player))
	{
		if (obj_player.estado == obj_player.estado_morto)
		{
			troquei = false;
			estado  = estado_end;
		}
	} else
	{
		troquei = false;
		estado  = estado_end;
	}
	
	timer = approach(timer, 0, 1);
	
	if (timer == 0)
	{
		troquei = false;
		estado  = estado_end;
	}
}

estado_end = function()
{
	if (estado_txt != "end")
	{
		sprites_index = 2;
		sprite_index  = spr_boss_laser_end;
		estado_txt    = "end";
	}
	ajusta_sprite(sprites_index);
	
	if(image_ind + image_spd >= image_numb)
	{
		instance_destroy();
	}
}

estado = estado_start;