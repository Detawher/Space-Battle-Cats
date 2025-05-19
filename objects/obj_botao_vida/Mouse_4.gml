/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
scpt_audio_play_sound(snd_exchangeweapons, 8, false);

image_xscale = 1.2;

image_yscale = 1.2;

if(instance_exists(obj_cat_mecanic))
{
	with(obj_cat_mecanic)
	{
		if(estado_txt != "arruma" and estado != estado_chegando)
		{	
			estado = estado_arruma;
			troquei = false;
		}
	}
}
