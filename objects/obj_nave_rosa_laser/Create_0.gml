// Inherit the parent event
event_inherited();

sprites = [
	[spr_nave_rosa_pre_atk],
	[spr_nave_rosa_atk],
	[spr_nave_rosa_pos_atk]
]

_id = noone;

estado_start = function()
{
	if (estado_txt != "start")
	{
		sprites_index = 0;
		sprite_index  = spr_nave_rosa_pre_atk;
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
		timer         = 60*2;
		sprites_index = 1;
		sprite_index  = spr_nave_rosa_atk
		estado_txt    = "loop";
	}
	ajusta_sprite(sprites_index);
	
	if (!instance_exists(_id))
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
		sprite_index  = spr_nave_rosa_pos_atk;
		estado_txt    = "end";
	}
	ajusta_sprite(sprites_index);
	
	if(image_ind + image_spd >= image_numb)
	{
		_id._laser = undefined;
		instance_destroy();
	}
}

estado = estado_start;