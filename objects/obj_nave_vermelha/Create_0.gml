// Inherit the parent event
event_inherited();

image_spd = 12 / 60;
direcao = 0;
timer_move = 0;
espera_tiro = 10;
timer_tiro = 0;

sprites = [
    //sprites parado
    [spr_nave_vermelha]
];

estado_chegando = function()
{
	ajusta_sprite(sprites_index)
	if (y >= 70){estado = estado_mover_lados; troquei = false; y = 70}
	else {y = lerp(y, 75, .05)}
}

vida = 3;

estado_mover_lados = function() 
{
	timer_move++;
    if (estado_txt != "mover") {
        sprites_index = 0; 
        estado_txt = "mover";
    }
    ajusta_sprite(sprites_index);

    var velocidade = 2; 
    var limite_esquerda = 110; 
    var limite_direita = 370; 

    if (x >= limite_direita && direcao == 1) {
        direcao = -1; 
    }
    else if (x <= limite_esquerda && direcao == -1) {
        direcao = 1;
    }
	
	if(timer_move >= 60)
	{
		timer_move = 0;
		estado = estado_parado;
		troquei = false;
		
	}
	
	
    x += velocidade * direcao; 

    x = clamp(x, limite_esquerda, limite_direita);
	
	
	
	
		scpt_trail(0.5, #A53030, 0.1);
		//scpt_trail(.3,#A53030,0.3);
	
	
	
	
};

estado_parado = function()
{
	timer_move++;
	
	if (estado_txt != "mover") {
        sprites_index = 0; 
        estado_txt = "mover";
    }
    ajusta_sprite(sprites_index);
	
	if(timer_move >= 45)
	{
		timer_move = 0;
		estado = estado_mover_lados;
		troquei = false;
		direcao = choose(1,-1);
		
		
	}
	
	timer_tiro--;
	if (timer_tiro <= 0)
	{
		_tiro = instance_create_layer(x, y+10, "Inimigos", obj_bullet_nave_vermelho)
		with(_tiro)
		{
			vspeed = 10;
			image_angle = 180;
			
		}
		
		
		timer_tiro = espera_tiro;
	
	
	
	}
	
	
}



estado = estado_chegando;