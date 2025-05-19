if inicializar== false {
scr_textos();
inicializar = true;
}


if caractere < string_length(texto_grid[# Infos.Texto, pagina])
{
	if (global._interate_key)
	{
	caractere = string_length(texto_grid[# Infos.Texto, pagina])
	}
} else
{
 if pagina < ds_grid_height(texto_grid) - 1
   {
	   if (global._interate_key)
	   {
	   alarm[0] = 1;
	   caractere = 0;
	   pagina++;
	   }
   }else
{
		if (op_num != 0)
	{
		op_draw = true;
	}else
	{
		if (global._interate_key)
		{
		if (dialogo_action == true)
		{
		action_end();
		}
		instance_destroy();
		}
	}
}
}




