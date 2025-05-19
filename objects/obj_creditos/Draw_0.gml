draw_set_font(global.font_pixel);
draw_set_colour(c_white);
draw_set_halign(fa_center);
draw_text(240, y+10, text);
draw_sprite_ext(spr_nome_jogo,0, 240, y, 1, 1, 0, c_white, 1);

if (text_agradecimento == true)
{
draw_set_halign(fa_center);
draw_text_ext_color(240, 125, text_2, 1, 1000, c_white, c_white, c_white, c_white, alpha)
}
