function scr_textos(){
switch npc_nome{
	
	case "tutorial 1":
		ds_grid_add_text("Presta atençao! Daqui a 8.564.268 patas tá aparecendo algo no radar", spr_lili, 0, "Lili");
		ds_grid_add_text("Então tenta se posicionar..", spr_lili, 0, "Lili");
		ds_grid_add_text("awu!", spr_betinho, 0, "Betinho");
		obj_dialogo.dialogo_action = true;
	break;
	
	case "tutorial 2":
		ds_grid_add_text("awabi babawi daba", spr_betinho2, 0, "Betinho");
		ds_grid_add_text("Como eles se aproximaram tão rápido?", spr_lili_2, 0, "Lili");
		ds_grid_add_text("bibi waui", spr_betinho3, 0, "Betinho");
		ds_grid_add_text("tem razão!", spr_lili, 0, "Lili");
		ds_grid_add_text("deixa comigo, eu preparei uma coisinha pra eles", spr_lili_3, 0, "Lili");
		ds_grid_add_text("Agora o bicho vai pegar..", spr_lili_4, 0, "Lili");
		obj_dialogo.dialogo_action = true;
	break;
	
	case "tutorial 3":
		ds_grid_add_text("...", spr_betinho2, 0, "Betinho");
		ds_grid_add_text("Não fica ai com essa cara!", spr_lili_5, 0, "Lili");
		ds_grid_add_text("O sistema não tá respondendo, Droga!", spr_lili_5, 0, "Lili");
		ds_grid_add_text("Eu não quero morrer agora..", spr_lili_6, 0, "Lili");
		ds_grid_add_text("wiwiwi", spr_betinho2, 0, "Betinho");
		obj_dialogo.dialogo_action = true;
	break;
	
	case "tutorial 4":
		ds_grid_add_text("Calma ai cara..", spr_walmor_1, 0, "");
		ds_grid_add_text("Não esqueceram que eu tava aqui não né", spr_walmor_1, 0, "");
		ds_grid_add_text("Essa máquina aqui foi feita pra aguenta porrada", spr_walmor, 0, "Walmor");
		ds_grid_add_text("Alem disso, eu sou o melhor miaucânico que vocês conheçem", spr_walmor, 0, "Walmor");
		obj_dialogo.dialogo_action = true;
	break;
	case "sala_6_fim":
		ds_grid_add_text("..", spr_betinho2, 0, "Betinho");
		ds_grid_add_text("o que foi isso? Que presença estranha é essa?", spr_lili_2, 0, "Lili");
		ds_grid_add_text("vocês já foram longe demais..", spr_elon, 0, "Elon");
		ds_grid_add_text("aconselho que.. deem meia volta", spr_elon, 0, "Elon");
		ds_grid_add_text("ou não poderão voltar mais...", spr_elon, 0, "Elon");
		ds_grid_add_text("...", spr_musk, 0, "Musk");
		obj_dialogo.dialogo_action = true;
	break;
	case "boss":
		ds_grid_add_text("Quanta ousadia.. mas coragem não vai os manter vivos.", spr_musk, 0, "Musk");
		ds_grid_add_text("liberem.. liberem a fortaleza...", spr_musk_1, 0, "Musk");		
		ds_grid_add_text("sim meu senhor.", spr_elon, 0, "Elon");	
		obj_dialogo.dialogo_action = true;
	break;
	case "boss_fim":
		ds_grid_add_text("Presta atenção! daqui a 8564268 patas ta aparecendo algo no radar", spr_lili, 0, "Lili");
		ds_grid_add_text("Entao tenta se posicionar..", spr_lili, 0, "Lili");
		ds_grid_add_text("awu!", spr_betinho, 0, "Betinho");
		obj_dialogo.dialogo_action = true;
	break;
		
}
}

function ds_grid_add_row()
{
var _grid = argument[0];
ds_grid_resize(_grid,ds_grid_width(_grid),ds_grid_height(_grid)+1);
return(ds_grid_height(_grid)-1);
}

function ds_grid_add_text()
{
var _grid = texto_grid;
var _y = ds_grid_add_row(_grid);

_grid[# 0, _y] = argument[0];
_grid[# 1, _y] = argument[1];
_grid[# 2, _y] = argument[2];
_grid[# 3, _y] = argument[3];
}

function add_op(_texto, _resposta)
{
	op[op_num] = _texto;
	op_resposta[op_num] = _resposta;
	
	op_num++;
}