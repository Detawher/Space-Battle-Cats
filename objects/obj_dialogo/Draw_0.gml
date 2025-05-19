if (inicializar)
{
	
	
	var _stgw = string_width(texto_grid[# Infos.Nome, pagina]);
	

	var _c = c_black;
	var _sprite = texto_grid[# Infos.Retrato, pagina];
	var _texto = string_copy(texto_grid[# Infos.Texto, pagina], 0, caractere);
	draw_set_font(global.font_pixel);
	
	if (texto_grid[# Infos.Lado, pagina] == 0)
	{
		//desenhando a moldura (parte de trás e da frente)
		draw_sprite_ext(spr_dialogo_30__alpha, 0, 100, 0, 1, 1, 0, c_white, .3);
		draw_sprite(spr_dialogo46, 0, 100, 0);
		
		//desenhando o nome
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_text(102, -1, texto_grid[# Infos.Nome, pagina]);
		draw_set_halign(-1);
		draw_set_valign(-1);
		
		//desenhando o texto
		draw_text_ext( 155 , 11, _texto, 10, 209);
		
		//desenhando o portrait
		draw_sprite_ext(_sprite, 0, 100, 0, 1, 1, 0, c_white, 1);
		
	} 
	else if (texto_grid[# Infos.Lado, pagina] == 1)
	{
		//desenhando a moldura (parte de trás e da frente)
		draw_sprite_ext(spr_dialogo_30__alpha, 0, 380, 0, -1, 1, 0, c_white, .3);
		draw_sprite_ext(spr_dialogo46, 0, 380, 0, -1, 1, 0, c_white, 1);
		
		//desenhando o nome
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_text(380 - 52, -1, texto_grid[# Infos.Nome, pagina]);
		draw_set_halign(-1);
		draw_set_valign(-1);
		
		//desenhando o texto
		draw_text_ext( 117, 11, _texto, 10, 209);
		
		//desenhando o portrait
		draw_sprite_ext(_sprite, 0, 380 - 54, 0, 1, 1, 0, c_white, 1);
		
	} 
}