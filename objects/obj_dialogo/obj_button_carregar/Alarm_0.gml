/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor









// Inherit the parent event
event_inherited();

sys_load("save.ini");
var tran = instance_create_layer(0, 0, layer, obj_transicao_prologo);
if (global.player_local_room == 1){var _sala = rm_room11};
if (global.player_local_room == 2){var _sala = rm_room10};
obj_player.x = global.player_local_x;
obj_player.y = global.player_local_y;
tran.destino = _sala
