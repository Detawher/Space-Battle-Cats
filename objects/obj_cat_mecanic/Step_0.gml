/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

if (instance_exists(obj_player))
{
	if (vida_feedback != obj_player.vida)
	{
	vida_feedback = approach(vida_feedback,obj_player.vida, .1)
	}
}