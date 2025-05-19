/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

image_spd = 6/ 60;

frame = 0;

if (instance_exists(obj_player))vida_visor = obj_player.vida*10
else{vida_visor = 100;}
vida_feedback = 10;

sprites = [
			//sprites parado
			[spr_mecanic],
			[spr_mecanic_ativa]
		  ];
		  
//estados
estado_chegando = function()
{
	if (estado_txt != "chegando")
	{
		sprites_index = 0;
		estado_txt = "chegando";
	}
	ajusta_sprite(sprites_index);
	
	
	
	if (x != 0)x = approach(x, 0, 1);
	
	if (instance_exists(obj_botao_vida))
	{
		obj_botao_vida.x = x + 77;
	}
	
	if (x == 0)
	{
			troquei = false;
			estado  = estado_parado;
	}
}

estado_parado = function()
{
	if (estado_txt != "parado")
	{
		sprites_index = 0
		estado_txt = "parado"
	}
	ajusta_sprite(sprites_index)

}

estado_arruma = function()
{
	if (estado_txt != "arruma")
	{
		sprites_index = 1
		estado_txt = "arruma"
	}
	ajusta_sprite(sprites_index)


	if(image_ind + image_spd >= image_numb)
	{
		scpt_audio_play_sound(snd_repair, 8, false);
		estado = estado_parado;
		troquei = false;
		if (instance_exists(obj_player))
		{
			with(obj_player)
			{
				if (vida <= 9) 
				{vida += 1;}
				//mudando_tiro(0);
			}
		}
		if(vida_visor <= 90)
		{
			vida_visor+=10;
		}
		/*if (instance_exists(obj_painel_armas))
		{
			obj_painel_armas.arma_atual = undefined;
			obj_painel_armas.nave_atual = undefined;
		}*/
	}
}


estado = estado_chegando;