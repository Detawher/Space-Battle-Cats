/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();
estado = noone;

image_spd = 15 / 60;


sprites = [
    //sprites parado
    [spr_janela_virus_open],
    [spr_janela_virus_loop],
	[spr_janela_virus_close]
];


estado_parado = function()
{
	if (estado_txt != "parado")
	{
		sprites_index = 0
		estado_txt = "parado"
	}
	ajusta_sprite(sprites_index)
	
	
	if(image_ind + image_spd >= image_numb)
	{
		estado = estado_loop;
		troquei = false;
		
		
	}
	
	

}

estado_loop = function()
{
	if (estado_txt != "loop")
	{
		sprites_index = 1
		estado_txt = "loop"
	}
	ajusta_sprite(sprites_index)

var _area = point_in_rectangle(mouse_x,mouse_y,x,y,x+15,y+10)

if(_area)
{
	if(mouse_check_button_pressed(mb_left))
	{
		estado = estado_fim;
		troquei = false;
	}
	
	
}




}


estado_fim = function()
{
	if (estado_txt != "fecha")
	{
		sprites_index = 2
		estado_txt = "fecha"
		scpt_audio_play_sound(snd_cursor, 8, false);
	}
	ajusta_sprite(sprites_index)
	
	
	if(image_ind + image_spd >= image_numb)
	{
		instance_destroy();
	}
}


estado = estado_parado;