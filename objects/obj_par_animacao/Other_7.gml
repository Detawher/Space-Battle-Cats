if (sprite_index = spr_bruxa_transform){spr_funcionando = true; transformacao = false;}
if (sprite_index = spr_ghost_transform){spr_funcionando = true; transformacao = true; area_mob = false;}
if (sprite_index = spr_bruxa_die){
	room_goto(rm_die); 
	vida = vida_max; morreu = false; 
	spr_funcionando = true;
	global.iluminacao = false;
	}