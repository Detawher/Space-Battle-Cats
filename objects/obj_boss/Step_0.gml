// Inherit the parent event
if (!instance_exists(obj_cutscene_boss)){estado()}else{ajusta_sprite(sprites_index)}

if (timer_invencivel > 0){timer_invencivel = approach(timer_invencivel, 0, 1)}
if (instance_exists(obj_player))
{
	if (obj_player.estado == obj_player.estado_morto)
	{
		estado = estado_voltando
	}
}

image_xscale = lerp(image_xscale,1,.2);
image_yscale = lerp(image_xscale,1,.2);

vida_feedback = approach(vida_feedback, vida, .1)