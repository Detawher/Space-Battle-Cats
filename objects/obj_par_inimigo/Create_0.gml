event_inherited();
#region variaveis

vida = 3;
tempo_invencivel = 30;
timer_invencivel = 0;



#endregion
#region Metedos
perde_vida = function(_qnt = 1)
{
	if (timer_invencivel > 0) return;
	if (vida >= 1)
	{
		vida -= _qnt
		image_xscale = 1.2;
		image_yscale = 1.2;
		var _x =  random_range(x-10,x+10);
		var _y =  random_range(y-16,y);

		instance_create_depth(_x,_y,depth-1,obj_vfx);
		scpt_audio_play_sound(snd_exchangeweapons, 8, false);
	}
	if (vida <= 0)
	{
		var _vfx = instance_create_depth(x,y,depth-1,obj_vfx);
		_vfx.sprite_index = choose(spr_hit7,spr_hit10);
		scpt_audio_play_sound(snd_impact, 8, false);
		instance_destroy();
	}
	timer_invencivel = tempo_invencivel;
}

estado_voltando = function()
{
	if (estado_txt != "voltando")
	{
		timer_volta = 60*2;
		estado_txt = "voltando"
	}
	if (timer_volta > 0)timer_volta--;
	if (timer_volta <= 0)
	{
		y = lerp(y, -50, .1);
	}
}
#endregion