/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor









// Inherit the parent event
event_inherited();
audio_play_sound(snd_hover, 1, false)
var tran = instance_create_layer(0, 0, layer, obj_transicao_prologo);
tran.destino = rm_room_jornal1;
instance_destroy(obj_player);