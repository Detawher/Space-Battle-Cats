// Inherit the parent event
event_inherited();
#region variaveis
velv  = 0;
velh  = 0;

vel   = 3;

vida  = 10;
tempo_invencivel = 60;
timer_invencivel = 0;

sprites = [
			//sprites parado
			[spr_nave],
			//sprite morte
			[spr_hit10]
		  ];
		  
espera_tiro = 10;
timer_tiro = 0;

xscale = 1;
yscale = 1;
#endregion

#region Bullets
_nada = function()
{
	//sksks realmente não tem nada aqui;
}

_vermelho = function()
{
	var _tiro = instance_create_layer(x+3, y+3, "Bullets", obj_bullet_vermelho)
		_tiro.vspeed = -10;
		
		_tiro = instance_create_layer(x-3, y+3, "Bullets", obj_bullet_vermelho)
		_tiro.vspeed = -10;
		
		_tiro = instance_create_layer(x-10, y+11, "Bullets", obj_bullet_vermelho)
		_tiro.vspeed = -10;
		
		_tiro = instance_create_layer(x+10, y+11, "Bullets", obj_bullet_vermelho)
		_tiro.vspeed = -10;
	timer_tiro = espera_tiro/2;
	scpt_audio_play_sound(snd_firegun, 8, false);
}

_azul = function()
{
	//var _tiro = instance_create_layer(x+6, y+4, "Bullets", obj_bullet_azul)
	//	_tiro.vspeed = -8;
		
	//	_tiro = instance_create_layer(x-6, y+4, "Bullets", obj_bullet_azul)
	//	_tiro.vspeed = -8;
	var laser = instance_create_depth(x, y,depth, obj_bullet_laser);
	
	scpt_audio_play_sound(snd_firelase, 8, false);
	timer_tiro = espera_tiro;
}

_rosa = function()
{
	var _tiro = instance_create_layer(x+3, y+5, "Bullets", obj_bullet_rosa)
		_tiro.vspeed = -5;
		_tiro.hspeed = +.4;
		
	var	_tiro2 = instance_create_layer(x-3, y+5, "Bullets", obj_bullet_rosa)
		_tiro2.vspeed = -5;
		_tiro2.hspeed = -.4;
	
	
	var _tiro3 = instance_create_layer(x+8, y+7, "Bullets", obj_bullet_rosa)
		_tiro3.vspeed = -5;
		_tiro3.hspeed = +2;
		
	var	_tiro4 = instance_create_layer(x-8, y+7, "Bullets", obj_bullet_rosa)
		_tiro4.vspeed = -5;
		_tiro4.hspeed = -2;
	timer_tiro = espera_tiro;
	scpt_audio_play_sound(snd_shotgun, 8, false);
}

_amarela = function()
{
	//var _tiro = instance_create_layer(x+2, y+5, "Bullets", obj_bullet_amarelo)
	//	_tiro.vspeed = -.6;
	//	_tiro.hspeed = +.3;
		
	//var	_tiro2 = instance_create_layer(x-2, y+5, "Bullets", obj_bullet_amarelo)
	//	_tiro2.vspeed = -.6;
	//	_tiro2.hspeed = -.3;
	
	
	var _tiro3 = instance_create_layer(x+6, y+6, "Bullets", obj_bullet_amarelo)
		_tiro3.vspeed = -.7;
		_tiro3.hspeed = +.8;
		
	var	_tiro4 = instance_create_layer(x-7, y+6, "Bullets", obj_bullet_amarelo)
		_tiro4.vspeed = -.7;
		_tiro4.hspeed = -.8;
	
	
	
	
	
	
	//	var _tiro5 = instance_create_layer(x+2, y+18, "Bullets", obj_bullet_amarelo)
	//	_tiro5.vspeed = +.6;
	//	_tiro5.hspeed = +.3;
		
	//var	_tiro6 = instance_create_layer(x-2, y+18, "Bullets", obj_bullet_amarelo)
	//	_tiro6.vspeed = +.6;
	//	_tiro6.hspeed = -.3;
	
	
	var _tiro7 = instance_create_layer(x+11, y+15, "Bullets", obj_bullet_amarelo)
		_tiro7.vspeed = +.8;
		_tiro7.hspeed = +.8;
		
	var	_tiro8 = instance_create_layer(x-11, y+15, "Bullets", obj_bullet_amarelo)
		_tiro8.vspeed = +.8;
		_tiro8.hspeed = -.8;
		
		
		
		//lados
		var	_tiro9 = instance_create_layer(x-15, y+12, "Bullets", obj_bullet_amarelo)
		//_tiro9.vspeed = +.8;
		_tiro9.hspeed = -.8;
		
		var	_tiro10 = instance_create_layer(x+15, y+12, "Bullets", obj_bullet_amarelo)
		//_tiro9.vspeed = +.8;
		_tiro10.hspeed = +.8;
		
		
		//meio
		var _tiro11 = instance_create_layer(x, y, "Bullets", obj_bullet_amarelo)
		_tiro11.vspeed = -.8;
		//_tiro11.hspeed = +.3;
		//meio
		var _tiro12 = instance_create_layer(x, y+25, "Bullets", obj_bullet_amarelo)
		_tiro12.vspeed = +.8;
		//_tiro11.hspeed = +.3;
		
		timer_tiro = espera_tiro;
		scpt_audio_play_sound(snd_ar, 8, false);
		
}

_branca = function()
{
	var _tiro = instance_create_layer(x, y+8, "Bullets", obj_bullet_branco)
		_tiro.vspeed = 0.1;
	timer_tiro = espera_tiro*2;
}


Cor_tiro = [_nada, _vermelho,_azul,_amarela,_rosa, _branca];

tiro = 0;
#endregion

#region metodos
estado_start = function()
{
	if (estado_txt != "start")
	{
		estado_txt = "start"
	}
	ajusta_sprite(sprites_index);
	y = lerp(y, 182, .01);
	if (y <= 192)
	{troquei = false; estado = estado_parado}
}

estado_saindo = function()
{
	if (estado_txt != "saindo")
	{
		estado_txt = "saindo"
	}
	ajusta_sprite(sprites_index);
	y = lerp(y, -38, .01);
}

estado_parado = function()
{
	if (estado_txt != "parado")
	{
		sprites_index = 0
		estado_txt = "parado"
	}
	ajusta_sprite(sprites_index)
	controla_player();
}

estado_morto = function()
{
	if (estado_txt != "morto")
	{
		xscale = 1;
		yscale = 1;
		sprites_index = 1;
		estado_txt = "morto"
	}
	ajusta_sprite(sprites_index)
	if(image_ind + image_spd >= image_numb)
	{
		screenshake(20);
		instance_destroy();
		var _cutscene_morte = instance_create_layer(0, 0, "Superior", obj_par_cutscene)
		_cutscene_morte.cutscene = [
						[cutscene_wait, 3],
						[cutscene_change_room, room, seq_close, seq_open]
					];
	}
}


controla_player = function()
{	
	//Diminuindo o timer invencivel
	timer_invencivel--;
	
	var _velh = (global._dire - global._esq) * vel;
	x += _velh;
	x = clamp(x, 99 + sprite_width/2, 380 - sprite_width/2);
	
	var _velv = (global._baixo - global._cima) * vel;
	y += _velv
	y = clamp(y, sprite_height/2, 230 - sprite_height/2);
	
	xscale = lerp(xscale, 1, .4);
	yscale = lerp(yscale, 1, .4);
	
	timer_tiro--;
	if (global._atirar and timer_tiro <= 0)
	{
		Cor_tiro[tiro]();
	}
}

mudando_tiro = function(_numb = 1)
{
	tiro = _numb;
	timer_tiro = espera_tiro;
}




perde_vida = function(_qnt = 1)
{
	if (timer_invencivel > 0 or estado == estado_start) return;
	if (vida >= 1 and room != rm_tutorial_move and room != rm_tutorial_tiro and room != rm_tutorial_consertar)
	{
		vida -= _qnt;
		
		with(obj_cat_mecanic)
		{
			if (vida_visor > 0)
			{
				vida_visor -= _qnt * 10;
			}
		}
		
		xscale = 1.3;
		yscale = .7;
		screenshake(10);
		scpt_audio_play_sound(snd_rico, 9, false)
	}
	if (vida <= 0)
	{
		estado = estado_morto
	}
	timer_invencivel = tempo_invencivel;
}
#endregion
estado = estado_start;