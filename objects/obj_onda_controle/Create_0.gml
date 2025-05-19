_int_q = 0;

codigo = function()
{
	if (instance_exists(obj_player))
	{
		if (obj_player.estado != obj_player.estado_start)
		{
			if (_int_q > array_length(Inimigos)-Limite_inimigos)
			{
				Limite_inimigos--;
			}
			if (_int_q < array_length(Inimigos))
			{
				while(instance_number(obj_par_inimigo) < Limite_inimigos)
				{
					instance_create_layer(irandom_range(110, 370), -15, "Inimigos", Inimigos[_int_q])
					_int_q += 1
				}
			}
		}
	} 
	if(_int_q == array_length(Inimigos) and !instance_exists(obj_par_inimigo))
	{
		switch(room)
		{
			case rm_fase1:
			instance_create_layer(0, 0, "Instances", obj_cutscene_fase_end)
			obj_painel_armas.trocou();
			instance_destroy();
			break;
			case rm_fase2:
			instance_create_layer(0, 0, "Instances", obj_cutscene_fase_end)
			obj_painel_armas.trocou();
			instance_destroy();
			break;
			case rm_fase3:
			instance_create_layer(0, 0, "Instances", obj_cutscene_fase_end)
			obj_painel_armas.trocou();
			instance_destroy();
			break;
			case rm_fase4:
			instance_create_layer(0, 0, "Instances", obj_cutscene_fase_end)
			instance_destroy();
			break;
			case rm_fase5:
			instance_create_layer(0, 0, "Instances", obj_cutscene_fase_end)
			instance_destroy();
			break;
			case rm_fase6:
			instance_create_layer(0, 0, "Instances", obj_cutscene_fase_6_end)
			instance_destroy();
			break;
			
			default:instance_destroy()
		}
		instance_destroy();
	}
}