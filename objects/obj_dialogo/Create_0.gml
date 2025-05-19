enum Infos {
	Texto,
	Retrato,
	Lado,
	Nome
};

texto_grid = ds_grid_create(4, 0);
pagina = 0;

op[0] = "";
op_resposta[0] = "";
op_num = 0;
op_selecionada = 0;
op_draw = false;

inicializar = false;

font_pixel = font_add_sprite_ext(spr_fonte_1, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzÀÁÂÃÇÉÊÍÒÓÔÕÚàáâãçéêíòóôõú!'()+,-./;:=?0123456789", true, 7)

randomize();
caractere = 0;
dialogo_action = false;
alarm[0] = 2;

depth = -10000

