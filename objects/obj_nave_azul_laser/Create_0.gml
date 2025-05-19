// Inherit the parent event
event_inherited();

sprites = [
	[spr_nave_azul_laser],
]

_id = noone;

estado_movendo = function()
{
	if (estado_txt != "start")
	{
		sprites_index = 0;
		estado_txt    = "start";
	}
	ajusta_sprite(sprites_index);
	if (instance_exists(_id))
	{
		y = _id.y
	}
	else
	{
		instance_destroy();
	}
}

estado = estado_movendo;