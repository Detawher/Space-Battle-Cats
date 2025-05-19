/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

_under = undefined

desenha_pata = false;

margem_x = x+2+11;
margem_y = y+6+11;

ganha_arma = false;

frame = 0;

botao_qnt1 = function()
{
	//arma vermelha
	var botao = instance_create_depth(margem_x,margem_y,depth,obj_botao)
	with (botao){image_index = 0; arma_botao = spr_arma  nave_botao = spr_arma_vermelha}
}

botao_qnt2 = function()
{
	//destruindo os botões anteriores
	if (instance_exists(obj_botao)) instance_destroy(obj_botao);
	
	//arma vermelha
	var botao = instance_create_depth(margem_x,margem_y,depth,obj_botao)
	with (botao){image_index = 0; arma_botao = spr_arma  nave_botao = spr_arma_vermelha}
	
	//arma azul
	botao = instance_create_depth(margem_x+28,margem_y,depth,obj_botao)
	with (botao){image_index = 3; arma_botao = spr_arma_3 nave_botao = spr_arma_rosa}
}

botao_qnt3 = function()
{
	//destruindo os botões anteriores
	if (instance_exists(obj_botao)) instance_destroy(obj_botao);
	
	var botao = instance_create_depth(margem_x,margem_y,depth,obj_botao)
	with (botao){image_index = 0; arma_botao = spr_arma  nave_botao = spr_arma_vermelha}
	
	botao = instance_create_depth(margem_x+28,margem_y,depth,obj_botao)
	with (botao){image_index = 3; arma_botao = spr_arma_3 nave_botao = spr_arma_rosa}
	
	botao = instance_create_depth(margem_x+56,margem_y,depth,obj_botao)
	with (botao){image_index = 1; arma_botao = spr_arma_1 nave_botao = spr_arma_azul}
}

botao_qnt4 = function()
{
	//destruindo os botões anteriores
	if (instance_exists(obj_botao)) instance_destroy(obj_botao);
	
	var botao = instance_create_depth(margem_x,margem_y,depth,obj_botao)
	with (botao){image_index = 0; arma_botao = spr_arma  nave_botao = spr_arma_vermelha}
	
	botao = instance_create_depth(margem_x+28,margem_y,depth,obj_botao)
	with (botao){image_index = 3; arma_botao = spr_arma_3 nave_botao = spr_arma_rosa}
	
	botao = instance_create_depth(margem_x+56,margem_y,depth,obj_botao)
	with (botao){image_index = 1; arma_botao = spr_arma_1 nave_botao = spr_arma_azul}
	
	botao = instance_create_depth(margem_x,margem_y+30,depth,obj_botao)
	with (botao){image_index = 2; arma_botao = spr_arma_2 nave_botao = spr_arma_amarela}
}

botao_qnt5 = function()
{
	//destruindo os botões anteriores
	if (instance_exists(obj_botao)) instance_destroy(obj_botao);
	
	var botao = instance_create_depth(margem_x,margem_y,depth,obj_botao)
	with (botao){image_index = 0; arma_botao = spr_arma  nave_botao = spr_arma_vermelha}
	botao = instance_create_depth(margem_x+28,margem_y,depth,obj_botao)
	with (botao){image_index = 3; arma_botao = spr_arma_3 nave_botao = spr_arma_rosa}
	botao = instance_create_depth(margem_x+56,margem_y,depth,obj_botao)
	with (botao){image_index = 1; arma_botao = spr_arma_1 nave_botao = spr_arma_azul}
	botao = instance_create_depth(margem_x,margem_y+30,depth,obj_botao)
	with (botao){image_index = 2; arma_botao = spr_arma_2 nave_botao = spr_arma_amarela}
	botao = instance_create_depth(margem_x+56,margem_y+30,depth,obj_botao)
	with (botao){image_index = 4; arma_botao = spr_arma_4 nave_botao = spr_arma_branca}
}

quant_botoes = [botao_qnt1, botao_qnt2, botao_qnt3, botao_qnt4, botao_qnt5];




tran_close = false;
tran_open  = false;
trocou = function()
{
	image_ind = 0;
	image_spd = 14/ 60;
	
	obj_player.mudando_tiro(0)
	
	arma_atual = undefined;
	nave_atual = undefined;
	
	tran_close = true;
}

quant_botoes[global._numb]();


arma_atual = undefined;
nave_atual = undefined;