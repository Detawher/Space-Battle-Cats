/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor









// Inherit the parent event
event_inherited()
global.dialogo = false;
audio_play_sound(snd_unpause, 1, false);
instance_destroy(obj_button_salvar);
instance_destroy(obj_button_carregar);
instance_destroy();