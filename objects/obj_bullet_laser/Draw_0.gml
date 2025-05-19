/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

frame+= .2;


if (collision_height > 0) {
    draw_sprite_stretched(sprite_index, frame, x-4, y- 12 - collision_height, sprite_width, collision_height);
}

draw_sprite(spr_azul_efeito,frame,x,y);


draw_sprite(spr_rosa_balas,frame,x,impact_y+25);