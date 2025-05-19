/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();
#region variaveis
vida = 4;
image_spd = 12 / 60;
direcao = 1;
timer_atirar = 30;


sprites = [
    //sprites parado
    [spr_nave_rosa],
];
#endregion
#region estados
// Estados



estado_chegando = function()
{
	ajusta_sprite(sprites_index)
	if (y >= 35){estado = estado_parado; troquei = false; y = 35}
	else {y = lerp(y, 40, .05)}
}
	
estado_parado = function() {
    if (estado_txt != "parado") {
        sprites_index = 0;
        estado_txt = "parado";
    }
    ajusta_sprite(sprites_index);

    if (instance_exists(obj_player)) 
	{ 
		estado = estado_mover_lados;
    }
};

_laser = undefined

estado_atirando = function() {
    if (estado_txt != "atirarando")
	{
		_laser = instance_create_layer(x, y, "Bullets", obj_nave_rosa_laser)
		_laser._id  = id
        sprites_index = 0;
        estado_txt = "atirarando";
    }
    ajusta_sprite(sprites_index);

    if (!_laser) 
	{
        estado = estado_mover_lados;
        troquei = false;
    }
};

estado_mover_lados = function() {
	if (estado_txt != "mover")
	{
		timer_atirar  = random_range(60*3, 60*6); 
		sprites_index = 0;
		estado_txt	  = "mover";
	}
	
    timer_atirar = approach(timer_atirar, 0, 1);
    ajusta_sprite(sprites_index);

    var velocidade = 2; 
    var limite_esquerda = 110; 
    var limite_direita = 370; 

    if (x >= limite_direita && direcao == 1) 
	{
        direcao = -1; 
    }
    else if (x <= limite_esquerda && direcao == -1) 
	{
        direcao = 1;
    }

    x += velocidade * direcao; 

    x = clamp(x, limite_esquerda, limite_direita);
	
	 if (timer_atirar <= 0) 
    {
        
        estado = estado_atirando; // Transição para atirar
        troquei = false;
        
    }
};

estado = estado_chegando;
#endregion