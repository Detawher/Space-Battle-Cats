
if (desenha_laser)
{
	//desenhando as armas
	draw_sprite(spr_boss_armas_laser, 0, x,y+ _y_laser);
}

if (desenha_tiro)
{
	//desenhando as armas
	draw_sprite(spr_boss_armas_pequenas, 0, x,y+ _y_tiro);
}

#region corpo
//desenhando o corpo baixo(que muda de cor)
draw_sprite_ext(sprite, image_ind, x, y, image_xscale, image_yscale, image_angle, _cor, image_alpha)

if (vida >= 1)
{
	//desenhando o corpo meio(que não muda de cor)
	draw_sprite(spr_boss_corpo, 0, x, y);
	//desenhando o corpo cima(parte que tem animação)
	draw_sprite(spr_boss_corpo_cima, image_ind, x, y);
	if (timer_invencivel >= 24)
	{
		gpu_set_fog(true,#C7CFCC,0,0);
	    //Dentro desse gpu_set_fog deixa sua sprite toda branca
		//desenhando o corpo baixo(que muda de cor)
		draw_sprite_ext(sprite, image_ind, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
		//desenhando o corpo meio(que não muda de cor)
		draw_sprite(spr_boss_corpo, 0, x, y);
		//desenhando o corpo cima(parte que tem animação)
		draw_sprite(spr_boss_corpo_cima, image_ind, x, y);
		gpu_set_fog(false,-1,0,0);
	}
}
#endregion

#region vida

var _margem = 12;
var _yy = 171;
var _xx = _x - 55;
var amount_feedback = -1 - (12 * (vida_feedback - 1))
var _y2 = _yy + amount_feedback;

//desenho do fundo da vida
draw_set_color(#411D31)
draw_rectangle(_xx, _yy + 10, _xx + 28,_yy + -1 -12*8, false)

//desenho do feedback
draw_set_color(#D86141)
draw_rectangle(_xx, _yy + 10, _xx + 28, _y2, false)

//desenhando a hud
draw_sprite(spr_boss,0,_x,0)
draw_sprite(spr_boss_hud, 0, _x, 0);

//desenho das vidas
for(var i = 0;i< vida;i++)
{
	draw_sprite_ext(spr_vida_barra, 0, _xx, _yy -(_margem * i), 1.555556, 1, 0, c_white, 1);
}
#endregion

//for (var i = 0; i < array_length(array_txt); i++)
//{
//	draw_text(230, 100 + 20* i, array_txt[i]);
//}
