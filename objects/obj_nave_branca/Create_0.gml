/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

vida = 5;

espera_tiro = 10;
timer_tiro = 0;

sprites = [
			//sprite idle
			[spr_nave_branca]
		  ]

estado_chegando = function()
{
	if (estado_txt != "chegando")
	{
		timer = 30;
		x = 240;
		sprites_index = 0;
		estado_txt = "chegando"
	}
	ajusta_sprite(sprites_index)
		if (y >= 115)
		{
			timer = approach(timer, 0, 1);
			if (timer <= 0)
			{
				estado  = estado_atirando_pre
				troquei = false; 
			}
			y = 115;
		}
		else {y = lerp(y, 120, .05)}
}

estado_atirando_pre = function()
{
	if (estado_txt != "atirando_pre")
	{
		_vel          = 0;
		_dir          = 0;
		sprites_index = 0;
		estado_txt    = "atirando_pre"
	}
	ajusta_sprite(sprites_index)
	
	_vel = approach(_vel, 1, .01);
	_dir += _vel;
	if (_dir >= 360){_dir = 0;};
	
	image_angle = _dir;
	
	if (_vel >= 1)
	{
		estado  = estado_atirando;
		troquei = false;
	}
}

estado_atirando = function()
{
	if (estado_txt != "atirando")
	{
		sprites_index = 0;
		estado_txt    = "atirando"
	}
	ajusta_sprite(sprites_index)
	
	_dir += 1;
	if (_dir >= 360){_dir = 0;};
	
	image_angle = _dir;
	
	timer_tiro--;
	if (timer_tiro <= 0)
	{
		_tiro = instance_create_layer(x, y, "Inimigos", obj_boss_bullet)
		with(_tiro)
		{
			vspeed = -10;
			direction = other._dir+45;
			image_angle = direction+90;
		}
		_tiro = instance_create_layer(x, y, "Inimigos", obj_boss_bullet)
		with(_tiro)
		{
			vspeed = -10;
			direction = other._dir+45+90;
			image_angle = direction+90;
		}
		_tiro = instance_create_layer(x, y, "Inimigos", obj_boss_bullet)
		with(_tiro)
		{
			vspeed = -10;
			direction = other._dir+45+90*2;
			image_angle = direction+90;
		}
		_tiro = instance_create_layer(x, y, "Inimigos", obj_boss_bullet)
		with(_tiro)
		{
			vspeed = -10;
			direction = other._dir+45+90*3;
			image_angle = direction+90;
		}
		
		
		timer_tiro = espera_tiro;
	}
}

estado = estado_chegando;