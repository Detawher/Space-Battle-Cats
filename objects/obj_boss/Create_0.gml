// Inherit the parent event
event_inherited();

vida = 8;
sub_vida = 15;
//tempo_invencivel = 30;
//timer_invencivel = 0;
vida_feedback = 8;

frame = 0;

sprites = [
			//sprites parado
			[spr_boss_corpo_under],
			//sprite morrendo
			[spr_boss_explosoes_morte]
		  ];

_cor =  #C7CFCC;
_cor_red = #A53030; 
_cor_pinky = #C65197; 
_cor_blue = #4F8FBA; 

perde_vida = function(_qnt = 1)
{
	if (timer_invencivel > 0) return;
	if (vida >= 1)
	{
		vida -= _qnt
		image_xscale = 1.2;
		image_yscale = 1.2;
		var _x =  random_range(x-90,x+90);
		var _y =  random_range(y,y+25);

		instance_create_depth(_x,_y,depth-1,obj_vfx);
		scpt_audio_play_sound(snd_impact, 8, false);
	}
	if (vida == 7)ataque_laser += 1 
	if (vida == 5){ataque_laser += 1 ataque_hack += 1;}
	if (vida == 1)ataque_laser += 1
	if (vida <= 0)
	{
		estado = estado_morrendo;
		troquei = false;
		//instance_destroy();
	}
	timer_invencivel = tempo_invencivel;
}

_sub_perde_vida = function(_qnt = 1)
{
	if (timer_invencivel > 0) return;
	if (sub_vida >= 1)
	{
		sub_vida -= _qnt;
		var _x =  random_range(x-90,x+90);
		var _y =  random_range(y,y+25);

		instance_create_depth(_x,_y,depth-1,obj_vfx);
		scpt_audio_play_sound(snd_exchangeweapons, 8, false);
	}
	if (sub_vida <= 0)
	{
		perde_vida();
		_cor = #C7CFCC;
		sub_vida = 15;
	}
	timer_invencivel = tempo_invencivel;
}

_toma_dano = function()
{
	switch (_cor)
	{
		case _cor_red:
		if (instance_place(x, y+20, obj_bullet_vermelho)){_sub_perde_vida()};
		break;
		case _cor_pinky:
		if (instance_place(x, y+20, obj_bullet_rosa)){_sub_perde_vida()};
		break;
		case _cor_blue:
		if (instance_place(x, y+20, obj_bullet_laser)){_sub_perde_vida()};
		break;
	}
	
}


_y = y;
_x = 480+96;
estado_chegando = function()
{
	if (estado_txt != "chegando")
	{
		sprites_index = 0;
		estado_txt = "chegando";
	}
	ajusta_sprite(sprites_index);
	
	if (y != 0)y = approach(y, 0, 1);
	
	if (y == 0)
	{
		if (_x != 480)_x = approach(_x, 480, 2);
		
		if (_x == 480)
		{
			troquei = false;
			estado  = estado_parado;
		}
	}
}

array_txt = [];

//porcentagem de chances para cada estado
ataque_tiro_brisa = 2;
ataque_laser = 0;
ataque_hack = 0;
estado_parado = function()
{
	if (estado_txt != "parado")
	{
		_lista_estados_controle = []
		
		//ataque tiro_brisa
		repeat(ataque_tiro_brisa)
		{
			array_push(_lista_estados_controle, estado_tiro_pre);
			array_push(array_txt, "tiro");
		}
		//ataque laser
		repeat(ataque_laser)
		{
			array_push(_lista_estados_controle, estado_laser_pre);
			array_push(array_txt, "laser");
		}
		//ataque hack
		repeat(ataque_hack)
		{
			array_push(_lista_estados_controle, estado_hack);
			array_push(array_txt, "hack");
		}
		
		//aleatorizando a lista
		_lista_estados_controle = array_shuffle(_lista_estados_controle);
		array_txt = array_shuffle(array_txt);
		
		// mudar esse tempo de espera para trocar de estado
		tempo_estado = (60* irandom_range(1,3));
		
		_cor = choose(_cor_blue, _cor_red, _cor_pinky);
		sprites_index = 0;
		estado_txt = "parado";
	}
	_toma_dano();
	estado_explosao();
	ajusta_sprite(sprites_index);
	
	tempo_estado = approach(tempo_estado, 0, 1)
	
	if (tempo_estado <= 0 or sub_vida <= 0)
	{
		
		estado = _lista_estados_controle[irandom(array_length(_lista_estados_controle)-1)];
		troquei = false;
		array_delete(_lista_estados_controle, 0, array_length(_lista_estados_controle));
		array_delete(array_txt, 0, array_length(array_txt));
	}	
}
#region explosao
timer_explosao = random_range(60*15, 60 *20);
estado_explosao = function()
{
	if (vida <= 5)timer_explosao = approach(timer_explosao, 0, 1);
	if (timer_explosao == 0)
	{
		var explosao = choose(estado_missel1, estado_missel2, estado_missel3, estado_missel4);
		explosao();
		timer_explosao = random_range(60*15, 60 *25);
	}
}
#endregion
#region hack
estado_hack = function()
{if (estado_txt != "hack")
	{
		
		timer_1 = 10;
		timer_2 = 10;
		timer_3 = 10;
		
		
		sprites_index = 0;
		estado_txt = "hack"
	} else
	{
		_toma_dano();
		estado_explosao();
		ajusta_sprite(sprites_index);
		//vai descer os timer em sequencia
		if (timer_2 == 10)timer_1 = approach(timer_1, 0, 1);
		if (timer_1 == 0 and timer_3 == 10)timer_2 = approach(timer_2, 0, 1);
		if (timer_2 == 0)timer_3 = approach(timer_3, 0, 1);
	
		//vai instanciar os hacks
		if(timer_1 == 1){instance_create_depth(random_range(0, 404),random_range(0, 211),-500,obj_hack_amarelo);}
		if(timer_2 == 1){instance_create_depth(random_range(0, 404),random_range(0, 211),-500,obj_hack_amarelo);}
		if(timer_3 == 1)
		{
			instance_create_depth(random_range(0, 404),random_range(0, 211),-500,obj_hack_amarelo)
			estado  = estado_parado
			troquei = false;
		};
	}
}
#endregion
#region laser
desenha_laser = false;
estado_laser_pre = function()
{
	if (estado_txt != "laser_pre")
	{
		
		desenha_laser = true;
		_y_laser = -35;
		
		//tempo de espera
		timer_laser = 30;
		
		sprites_index = 0;
		estado_txt = "laser_pre"
	}
	_toma_dano();
	estado_explosao();
	ajusta_sprite(sprites_index);
	
	if (_y_laser != 0) _y_laser = approach(_y_laser, 0, .8);
	
	if (_y_laser == 0)
	{
		timer_laser =  approach(timer_laser, 0, 1);
		if (timer_laser == 0)
		{
		troquei = false;
		estado  = estado_laser;
		}
	}
}

estado_laser = function()
{
	if (estado_txt != "laser")
	{
		instance_create_layer(choose(x - 74, x + 74), 33, "Bullets", obj_boss_laser)
		sprites_index = 0;
		estado_txt = "laser"
	}
	_toma_dano();
	estado_explosao();
	ajusta_sprite(sprites_index);
	
	if (!instance_exists(obj_boss_laser))
	{
		estado = estado_laser_end;
	}
}

estado_laser_end = function()
{
	if (estado_txt != "laser_end")
	{
		
		//tempo de espera
		timer_laser = 60;
		
		sprites_index = 0;
		estado_txt = "laser_end"
	}
	_toma_dano();
	estado_explosao();
	ajusta_sprite(sprites_index);
	
	timer_laser =  approach(timer_laser, 0, 1);
	
	if (timer_laser == 0)
		{
			if (_y_laser > -35) _y_laser = approach(_y_laser, -35, 1);
			
			if (_y_laser == -35)
			{
				//desenha_laser = false;
				troquei = false;
				estado  = estado_parado;
			}
	}
}
#endregion
#region tiro
desenha_tiro = false;
estado_tiro_pre = function()
{
	if (estado_txt != "tiro_pre")
	{
		
		desenha_tiro = true;
		_y_tiro = -35;
		
		//tempo de espera
		timer_tiro = 30;
		
		sprites_index = 0;
		estado_txt = "tiro_pre"
	}
	_toma_dano();
	estado_explosao();
	ajusta_sprite(sprites_index);
	
	if (_y_tiro != 0) _y_tiro = approach(_y_tiro, 0, .8);
	
	if (_y_tiro == 0)
	{
		timer_tiro =  approach(timer_tiro, 0, 1);
		if (timer_tiro == 0)
		{
			estado  = estado_tiro;
			troquei = false;
		}
	}
}

estado_tiro = function()
{
	_vira_diret = function()
	{
		_ang = approach(_ang, 340, .6);
		if(_ang == 340)estado_tiro_2 = _volta;
	}
	_vira_esq = function()
	{
		_ang = approach(_ang, 200, .6);
		if(_ang == 210)estado_tiro_2 = _volta;
	}
	_volta = function()
	{
		_ang = approach(_ang, 270, .6);
		if (_ang == 270)estado_tiro_2 = estado_escolhendo
	};
	estado_escolhendo = function()
	{
		if (instance_exists(obj_player))
		{
			if (obj_player.x >= 240)
			{
				estado_tiro_2 = _vira_diret
			}
			if (obj_player.x < 240)
			{
				estado_tiro_2 = _vira_esq
			}
		} else {estado_tiro_2 = _volta}
	}
	if (estado_txt != "tiro")
	{
		espera_tiro   = 10;
		timer_tiro    = 60*10;
		timer_tiro_2  = 10;
		_ang          = 270;
		sprites_index = 0;
		estado_txt = "tiro"
		estado_tiro_2 = estado_escolhendo;
	}
	_toma_dano();
	estado_explosao();
	ajusta_sprite(sprites_index);
	
	estado_tiro_2();
	timer_tiro = approach(timer_tiro, 0, 1);
	
	timer_tiro_2--;
	if (timer_tiro_2 <= 0)
	{
		var _tiro = instance_create_layer(x-11, y+ 53, "Bullets", obj_boss_bullet)
		with(_tiro){vspeed = 10; direction = obj_boss._ang; image_angle = direction+90}
		//_tiro.direction =270; vai ser com isso que vamos fazer o movimento de parabrisa
		var _tiro = instance_create_layer(x+11, y+ 53, "Bullets", obj_boss_bullet)
		with(_tiro){vspeed = 10; direction = obj_boss._ang; image_angle = direction+90}
		timer_tiro_2 = espera_tiro;
	}
	
	if (timer_tiro == 0)
	{
		estado = estado_tiro_end;
	}
}

estado_tiro_end = function()
{
	if (estado_txt != "tiro_end")
	{
		
		//tempo de espera
		timer_tiro = 60;
		
		sprites_index = 0;
		estado_txt = "tiro_end"
	}
	_toma_dano();
	estado_explosao();
	ajusta_sprite(sprites_index);
	
	timer_tiro =  approach(timer_tiro, 0, 1);
	
	if (timer_tiro == 0)
		{
			if (_y_tiro > -35) _y_tiro = approach(_y_tiro, -35, 1);
			
			if (_y_tiro == -35)
			{
				//desenha_laser = false;
				troquei = false;
				estado  = estado_parado;
			}
	}
}
#endregion

estado_missel1 = function()
{

	var _bomba = noone;


		var coordenadas = [
	    [119, 8],   // 1
	    [182, 8],   // 2
	    [245, 8],   // 3
	    [308, 8],   // 4
	    [119, 70],  // 5
	    [182, 70],  // 6
	    [245, 70],  // 7
		[245,132],
	    [308, 70],  // 8
	    [119, 132], // 9
	    [308, 132], // 10
	    [119, 194], // 11
	    [308, 194]  // 12
	];

	// Criar objetos nas coordenadas
	for (var i = 0; i < array_length(coordenadas); i++) {
	     _bomba = instance_create_layer(coordenadas[i][0], coordenadas[i][1], "Instances", obj_missel_boss);
		 _bomba = noone;
	}
}
estado_missel2 = function()
{

var _bomba = noone;


	var coordenadas = [
    
     // 6
    [245, 70],  // 7
	[245,132],
	[182,132],
	[182,194],
	[245,194],
    [308, 70],  // 8
    [119, 132], // 9
    [308, 132], // 10
    [119, 194], // 11
    [308, 194]  // 12
];

// Criar objetos nas coordenadas
for (var i = 0; i < array_length(coordenadas); i++) {
     _bomba = instance_create_layer(coordenadas[i][0], coordenadas[i][1], "Instances", obj_missel_boss);
	 _bomba = noone;
}
	
	
}

estado_missel3 = function()
{

var _bomba = noone;


	var coordenadas = [
    
     // 6
    [182, 8],  // 7
	[245,8],
	[184,70],
	[245,70],
	[245,194],
    [182,194],  // 8
    [182, 132], // 9
    [245, 132], // 10
   
];

// Criar objetos nas coordenadas
for (var i = 0; i < array_length(coordenadas); i++) {
     _bomba = instance_create_layer(coordenadas[i][0], coordenadas[i][1], "Instances", obj_missel_boss);
	 _bomba = noone;
}
	
	
}

estado_missel4 = function()
{

var _bomba = noone;


	var coordenadas = [
    
    [119, 194],  
	[308, 194],
	[119, 132],
	[308, 132],  
	[245, 194],  
    [182, 194],  
    [182, 132], 
    [245, 132], 
   
];

// Criar objetos nas coordenadas
for (var i = 0; i < array_length(coordenadas); i++) {
     _bomba = instance_create_layer(coordenadas[i][0], coordenadas[i][1], "Instances", obj_missel_boss);
	 _bomba = noone;
}
	
	
}

estado_morrendo = function()
{
	if (estado_txt != "morrendo")
	{
		sprites_index = 1;
		//instance_create_depth(0, 0, 0, obj_cutscene_boss_end);
		scpt_audio_play_sound(snd_explosion, 8, true);
		set_song_ingame(noone, 30, 30)
		timer = 60 * 5;
		estado_txt = "morrendo";
	}
	ajusta_sprite(sprites_index);
	
	if (timer >= 0)timer--;
	if (timer <= 0)
	{
		if (y > -75)y = approach(y, -100, 1);
		
		if (y==-74)
		{
			audio_pause_sound(snd_explosion);
			TransitionStart(rm_credits, seq_FadeOut, seq_FadeIn);
		}
	}
}

estado = estado_chegando;