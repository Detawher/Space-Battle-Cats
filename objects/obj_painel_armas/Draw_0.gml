/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor



if(desenha_pata)
{
	var _x = mouse_x;
	var _y = mouse_y;
	
	_x = clamp(_x , 382 + 18, 479 - 18);
	_y = clamp(_y, 190 + 13, 270);
	
	draw_sprite(spr_pata,0,_x,_y);
	cursor_sprite = -1;
}
else
{
	cursor_sprite = spr_cursor;
}

draw_self();

if (tran_close)
{
	//quantidade de imagens na sprite
	var image_numb = sprite_get_number(spr_painel_armas_transisao_in);
	
	draw_sprite(spr_painel_armas_transisao_in, image_ind, x, y);

	image_ind += image_spd;
	image_ind %= image_numb;
	
	if (image_ind + image_spd >= image_numb)
	{
		if (global._numb < array_length(quant_botoes)-1 and global._numb >= 0)
		{
			global._numb += 1;
			quant_botoes[global._numb]();
		}
		image_ind  = 0;
		image_spd  = 14/ 60;
		tran_close = false;
		tran_open  = true; 
	}
}
if (tran_open)
{
	//quantidade de imagens na sprite
	var image_numb = sprite_get_number(spr_painel_armas_transisao_out);
	
	draw_sprite(spr_painel_armas_transisao_out, image_ind, x, y);
	
	image_ind += image_spd;
	image_ind %= image_numb;
	
	if (image_ind + image_spd >= image_numb)
	{
		tran_open = false
	}
	
	ganha_arma = true;
	
}

if (!tran_close and !tran_open)
{
	if(arma_atual)
	{
		draw_sprite(arma_atual,0,x-47,y+35);
	}
	if(nave_atual and instance_exists(obj_player))
	{
		draw_sprite(nave_atual,0,obj_player.x,obj_player.y);
	}
}


if(ganha_arma)
{
	frame += .25;
	draw_sprite_ext(spr_arma_nova,frame,378,163,1,1,0,c_white,1);
	if(arma_atual)
	{
		ganha_arma = false;
		frame = 0;
	}
}
	
