/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();



//variaveis do feedback
var _margem = 12;
var _y = y+249;
var _x = x+26;
var amount_feedback = -1 - (12 * (vida_feedback - 1))
var _y2 = _y + amount_feedback;


//desenhando o fundo da hud
draw_set_color(#411D31);
draw_rectangle(x+26, 141, x+26+18, 141+118, false);

if (instance_exists(obj_player))
{
	//desenhando o feedback
	draw_set_color(#D86141)
	draw_rectangle(_x, _y + 10, _x + 18, _y2, false)
	//desenhando a vida
	for(var i = 0;i< obj_player.vida;i++)
	{

		draw_sprite(spr_vida_barra,0,_x,_y -(_margem * i))
	}
}
//desenhando o sprite hud_vida
draw_sprite(spr_vida_hud, 0, x, 80);

draw_set_font(global.font_pixel)
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(x+32,y+105, vida_visor);
draw_set_halign(-1);
draw_text(x+32,y+105, " % ");
draw_set_font(-1);

draw_set_color(-1);

if (instance_exists(obj_player))
{
	if(obj_player.vida <= 4)
	{
		draw_sprite(spr_alerta,frame,0,0);
		//scpt_audio_play_sound(snd_sos, 8, true);
		frame += .2;
	} else
	{
		frame = 0;
	}
	
}