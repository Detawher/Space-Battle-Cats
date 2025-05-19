sprite = sprite_index

estado = noone;

//texto debug
estado_txt = "";

face = 0;
sprites = [
			//sprites parado
			[noone]
			
		  ];

sprites_index = 0;
//imagem atual da sprite
image_ind = 0;
//velocidade da animaçao
image_spd = 14/ 60;
//quantidade de imagens na sprite
image_numb = sprite_get_number(sprite);
troquei = false;

ajusta_sprite = function(_indice_array)
{
	//fazendo a sprite começar do frame 0 sempre q mudar de estado
	if(troquei == false)
	{
		image_ind = 0;
		troquei = true;
	}

	sprite = sprites[_indice_array][face];
	sprite_index = sprites[_indice_array][face];
	
	image_numb = sprite_get_number(sprite);
	//fazendo a sprite rodar toda
	image_ind += image_spd;
	image_ind %= image_numb;
}