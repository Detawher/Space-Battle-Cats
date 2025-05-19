/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
frame = 0;

animacao = 0;

acabou = false;

//numero de ondas variaveis
onda1 = false;
onda2 = false;
onda3 = false;
onda4 = false;
onda5 = false;
onda6 = false;


estado = noone;

global.tutorial = true;


a = true;
w = true;
s = true;
d = true;
fim = 0;
timer = 0;

delay = 0;

desenha_up_arma = false;


ganha_arma = function()
{

desenha_up_arma = true;
	
	if(fim == 0)
	{
		with(obj_painel_armas)
		{
			_numb +=1;
		}
		fim+=1;
	}
	
}








botoes = function()
	{
	
		
	
	if(frame == 2)
	{
		draw_sprite_ext(spr_janela_fundo,0,x,y,1,1,0,c_white,0.5);
	}
	var _janela = draw_sprite(spr_janela_tutorial,frame,x,y)

	if(frame <= 1)
	{
	frame+= .2;
	}
	else
	{
		frame = 2;
	}
	
	
	
		if a draw_sprite(spr_a,0,x-40,y+40)
		if w draw_sprite(spr_w,0,x-15,y-26)
		if s draw_sprite(spr_s,0,x+10,y+50)
		if d draw_sprite(spr_d,0,x+100,y+10)


	draw_sprite_ext(spr_move_nave,animacao,x+5,y+8,1,1,0,c_white,1);
	
	
	}
	

botoes2 = function()
	{
	
		
	
	if(frame == 2)
	{
		draw_sprite_ext(spr_janela_fundo,0,x,y-40,1,1,0,c_white,0.5);
	}
	var _janela = draw_sprite(spr_janela_tutorial,frame,x,y-40)

	if(frame <= 1)
	{
	frame+= .2;
	}
	else
	{
		frame = 2;
	}
	
	
	
		
	if(frame == 2)
	{
		draw_sprite_ext(spr_vai_painel,animacao,x+5,y-32,1,1,0,c_white,1);
		
		draw_sprite_ext(spr_arma_nova,animacao,378,163,1,1,0,c_white,1);
	}
	
	
	}
	



tutorial_1 = function()
{

	
	if(keyboard_check_pressed(ord("A"))and a)
	{
		//show_message("edfe")
		fim+=1;
		a = false;
		var _confirma = instance_create_depth(x-40,y+40,depth-1,obj_effect)
		_confirma.sprite_index = spr_blink;
		scpt_audio_play_sound(snd_tecla, 8, false)
	}
	if(keyboard_check_pressed(ord("W"))and w)
	{
		//show_message("edfe")
		fim+=1;
		w = false;
		var _confirma = instance_create_depth(x-15,y-26,depth-1,obj_effect)
		_confirma.sprite_index = spr_blink;
		scpt_audio_play_sound(snd_tecla, 8, false)
	}
	if(keyboard_check_pressed(ord("S"))and s)
	{
		//show_message("edfe")
		fim+=1;
		s = false;
		var _confirma = instance_create_depth(x+20,y+60,depth-1,obj_effect)
		_confirma.sprite_index = spr_blink;
		scpt_audio_play_sound(snd_tecla, 8, false)
	}
	if(keyboard_check_pressed(ord("D"))and d)
	{
		fim+=1;
		//show_message("edfe")
		d = false;
		var _confirma = instance_create_depth(x+100,y+10,depth-1,obj_effect)
		_confirma.sprite_index = spr_blink;
		scpt_audio_play_sound(snd_tecla, 8, false)
	}


	if(fim >= 4)
	{
		timer++;
		
		if(timer >= 25)
		{
			var _blink = instance_create_depth(x,y,depth-1,obj_effect)
			_blink.sprite_index = spr_janela_blink;
			
			
			//resetando as 59 variaveis inuteis q criei
			final = 0;
			frame = 0;
			timer = 0;
			animacao = 0;
			a = true;
			w = true;
			s = true;
			d = true;
			estado = tutorial_2;
		}
	}
}


tutorial_2 = function()
{
	if a timer++;
	
	if(timer == 100)
	{
		instance_create_depth(x,y,depth,obj_cutscene_tutorial_2)
		a = false;
		timer = 0;
	}
	
	if(!w)
	{
		TransitionStart(rm_tutorial_tiro,seq_close,seq_open)
			final = 0;
			frame = 0;
			timer = 0;
			animacao = 0;
			a = true;
			w = true;
			s = true;
			d = true;
			estado = tutorial_3;
		
	}
}

tutorial_3 = function()
{
	
	timer++;
	
	if(timer >= 170)
	{
		
	}
	
	if(obj_painel_armas.arma_atual)
	{
			var _blink = instance_create_depth(x,y-40,depth-1,obj_effect)
			_blink.sprite_index = spr_janela_blink;
			final = 0;
			frame = 0;
			timer = 0;
			animacao = 0;
			a = true;
			w = true;
			s = true;
			d = true;
			estado = tutorial_4;
	}
}

tutorial_4 = function()
{
	if(a)timer++;
	
	var _espaco = keyboard_check(vk_space);
	if(s)
	{
		if(timer >= 80 and _espaco)
		{
			a = false;
			timer = 0
			onda1 = true;
			s = false;
		}
	}

	if(onda1)timer++;
	
	if(onda1 and timer >= 70)
	{
		
		if(!instance_exists(obj_onda_controle))
		{
		var _onda = instance_create_depth(0,0,depth,obj_onda_controle)
		_onda.Inimigos = [obj_nave_vermelha,obj_nave_vermelha];
		_onda.Limite_inimigos = 1;
		onda1 = false;
		onda2 = true;
		timer = 0;
		
		}
		
	}
	
	//if(onda2)timer++;
	//if(onda2 and timer >= 70)
	//{
		
	//	if(!instance_exists(obj_onda_controle))
	//	{
	//	var _onda = instance_create_depth(0,0,depth,obj_onda_controle)
	//	_onda.Inimigos = [obj_nave_vermelha,obj_nave_vermelha];
	//	_onda.Limite_inimigos = 2;
	//	onda2 = false;
	//	timer = 0;
	//	w = false;
	//	}
		
	//}
	
	
	//if(!w and timer == 0)
	//{
	//	if(!instance_exists(obj_par_inimigo))
	//	{			
	//		obj_painel_armas.trocou();
	//		d = false;
	//	}
		
		
	//}
	
	
	
	
	
	
	
	
	if(keyboard_check_released(vk_f2))
	{
		instance_create_layer(0,0,"Inimigos",obj_nave_tutorial);
			
	}
	
	if(onda2)timer++;
	if(onda2 and timer >= 70)
	{  
		if(!instance_exists(obj_onda_controle))
		{
			//TransitionStart(rm_tutorial_consertar,seq_close,seq_open);
			estado = tutorial_5;
			final = 0;
			frame = 0;
			timer = 0;
			animacao = 0;
			a = true;
			w = true;
			s = true;
			d = true;
			onda1 = true;
			onda2= false;
			
			}
	}
	
	
}

tutorial_5 = function()
{
	//show_message("isso")
	//var _onda = instance_create_depth(0,0,depth,obj_onda_controle)
	//_onda.Inimigos = [1,2,3,4];
	//_onda.Limite_inimigos = 2;
	if(onda1)timer++;
	if(onda1 and timer >= 70)
	{
		
		if(!instance_exists(obj_onda_controle))
		{
		var _onda = instance_create_depth(0,0,depth,obj_onda_controle)
		_onda.Inimigos = [obj_nave_vermelha,obj_nave_vermelha];
		_onda.Limite_inimigos = 2;
		onda1 = false;
		onda2 = true;
		timer = 0;
		
		}
		
	}
	if(onda2)timer++;
	if(onda2 and timer >= 70)
	{  
		if(!instance_exists(obj_onda_controle))
		{
			//TransitionStart(rm_tutorial_consertar,seq_close,seq_open);
			final = 0;
			frame = 0;
			timer = 0;
			animacao = 0;
			a = true;
			w = true;
			s = true;
			d = true;
			estado = tutorial_6;
			onda1 = true;
			onda2 = false;
			}
	}
	
	
	
	
	
	
	
	
	
	
	
}


tutorial_6 = function()
{
	if(a)timer++;
	
	if(timer == 40)
	{
		obj_painel_armas.trocou()
		s = false;
	}
	
	if(!s)frame++;
	
	if(frame >= 400 and obj_painel_armas.arma_atual)
	{
			timer = 0;
			final = 0;
			frame = 0;
			timer = 0;
			animacao = 0;
			a = true;
			w = true;
			s = true;
			d = true;
			estado = tutorial_7;
			onda1 = true;
			onda2 = false;
		
	}
	
	
}

	tutorial_7 = function()
	{
	if(onda1)timer++;
	if(onda1 and timer >= 100)
	{
		
		if(!instance_exists(obj_onda_controle))
		{
		var _onda = instance_create_depth(0,0,depth,obj_onda_controle)
		_onda.Inimigos = [obj_nave_rosa ,obj_nave_vermelha, obj_nave_rosa ,obj_nave_vermelha]
		_onda.Limite_inimigos = 2;
		onda1 = false;
		onda2 = true;
		timer = 0;
		
		}
		
	}
	
	if(onda2)timer++;
	if(onda2 and timer >= 70)
	{  
	if(!instance_exists(obj_onda_controle))
		{
			//TransitionStart(rm_tutorial_consertar,seq_close,seq_open);
			
			final = 0;
			frame = 0;
			timer = 0;
			animacao = 0;
			a = true;
			w = true;
			s = true;
			d = true;
			estado = tutorial_8;
			onda1 = true;
			onda2 = false;
		
			}
		}
	
	
		
	}
	
	tutorial_8 = function()
	{
		timer++;
		{
			if(timer == 200)
			{
				instance_create_layer(0,0,"Inimigos",obj_nave_tutorial);
				
			}
		}
		if(instance_exists(obj_nave_tutorial))
		{
			timer = 0
			final = 0;
			frame = 0;
			timer = 0;
			animacao = 0;
			a = true;
			w = true;
			s = true;
			d = true;

			onda1 = true;
			onda2 = false;
		}
		
		if(acabou)
		{
			audio_pause_sound(snd_explosion)
			screenshake(1, 0.1);
			TransitionStart(rm_tutorial_consertar,seq_close,seq_open);
			estado = tutorial_9;
		}
		
		
	}
	
	tutorial_9 = function()
	{
		if(a)timer++;
	
		if(timer == 200)
		{
			obj_player.vida = 1;
			//obj_cat_mecanic.vida_visor = 10;
			a = false;
			timer = 0;
			estado = tutorial_10;
			
		}
		
		
		
		
		
		
		
		
		
		
	}
	
	tutorial_10 = function()
	{
		if(instance_exists(obj_cat_mecanic)and timer == 0)
		{
			if(obj_player.vida >= 10)
			{
				TransitionStart(rm_fase1,seq_close,seq_open);
				estado = tutorial_11;
			
			}
		}
		
		
	}
	tutorial_11 = function()
	{
		instance_destroy();
	}

estado = tutorial_1;