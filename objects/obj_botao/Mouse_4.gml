/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (!obj_painel_armas.tran_close and !obj_painel_armas.tran_open)
{
	image_xscale = escala_x * 1.2;
	image_yscale = escala_y * 1.2;
	if (instance_exists(obj_player))
	{
		with(obj_painel_armas)
		{
			arma_atual = other.arma_botao;
			nave_atual = other.nave_botao;
		}
	
		obj_player.mudando_tiro(image_index + 1);
	}
	scpt_audio_play_sound(snd_tablet, 8, false);
}