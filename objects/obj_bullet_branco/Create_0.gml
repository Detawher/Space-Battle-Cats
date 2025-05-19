/// @description Inserir descrição aqui
// Você pode escrever seu código neste editorim
//image_xscale = 2;
//image_yscale = 2;
estado = noone;
timer = 0;
ativa = false;




tem_inimigo = function()
{
	var _alvo = instance_nearest(x,y,obj_par_inimigo)

	if(_alvo != noone)
	{
	var _direcao = point_direction(x,y,_alvo.x,_alvo.y);
	image_angle = _direcao - 90;
	var vel = 2;
	motion_set(_direcao,vel)
	}

	if(!instance_exists(obj_par_inimigo)){instance_destroy();}

	
}

nao_tem_inimigo = function()
{vspeed = -5;}

estado_normal = function()
{
	timer++;
	
	if(timer = 5)
	{
		ativa = true;
	}
	
	if(ativa)
	{
		if(instance_exists(obj_par_inimigo))
		{
			estado = tem_inimigo;
		}
		else
		{
			estado = nao_tem_inimigo;
		}
	}
}




estado = estado_normal;