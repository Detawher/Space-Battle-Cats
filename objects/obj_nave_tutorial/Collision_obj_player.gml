/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(cut)
{
	instance_create_depth(x,y,depth,obj_cutscene_tutorial_3);
	instance_create_depth(obj_player.x,obj_player.y,-5000,obj_explosao);
	scpt_audio_play_sound(snd_explosion, 8, true);
	screenshake(5, 0);
	cut = false;
}