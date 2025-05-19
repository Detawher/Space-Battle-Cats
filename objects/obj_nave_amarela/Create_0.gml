/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();
#region variaveis
vida = 7;

image_spd = 12/ 60;
colidiu = false;
timer = 20;





sprites = [
			//sprites parado
			[spr_nave_amarela],
            [spr_carrapato_dano]
			
		  ];
#endregion
#region estado
estado_parado = function()
{
	if (estado_txt != "parado")
	{
		sprites_index = 0;
		estado_txt = "parado";
	}
	ajusta_sprite(sprites_index)

	if(x = obj_player.x)
	{
		estado = estado_onda;
		troquei = false;
	}
}

estado_onda = function()
{
	if (estado_txt != "onda")
	{
		sprites_index = 0;
		estado_txt = "onda";
	}
	ajusta_sprite(sprites_index)
	
	if(image_ind + image_spd >= image_numb)
	{
		estado = estado_atira;
		troquei = false;
		
	}
}

estado_atira = function()
{
    var jogador = instance_nearest(x, y, obj_player);
    
    if (jogador != noone)
	{
        var direcao = point_direction(x, y, jogador.x, jogador.y);
        image_angle = direcao + 90;
        var vel = 0.5; 
        motion_set(direcao, vel);
    }
    ajusta_sprite(sprites_index)
    if(colidiu)
    {
        estado = estado_grudado;
        troquei = false;
    }
}


estado_grudado = function() {
	if (estado_txt != "grudado")
	{
		image_angle = 0;
		colidiu = false;
		timer_dano = 120;
		obj_player.perde_vida();
		sprites_index = 0;
		estado_txt = "grudado";
	}
    ajusta_sprite(sprites_index)
	
	timer_dano = approach(timer_dano, 0, 1);
	
	var jogador = instance_nearest(x, y, obj_player);
    if (jogador != noone) 
	{
        x = jogador.x;
        y = jogador.y;
        // Criar efeito pulsante ao redor
        if (timer_dano <= 0) 
        {
			instance_create_depth(random_range(0, 404),random_range(0, 211),-500,obj_hack_amarelo);
            instance_create_layer(x, y, layer_get_id("Inimigos"), obj_pulso_dano);
			obj_player.perde_vida();
			timer_dano = 120;
        }
    }
};

estado = estado_atira
#endregion