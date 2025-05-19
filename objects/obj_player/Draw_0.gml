draw_sprite_ext(sprite, image_ind, x, y , xscale, yscale, image_angle, image_blend, image_alpha)

if (timer_invencivel >= 54)
{
	gpu_set_fog(true,#C7CFCC,0,0);
	    //Dentro desse gpu_set_fog deixa sua sprite toda branca
		draw_sprite_ext(sprite,image_ind, x, y ,image_xscale, image_yscale, image_angle, image_blend, image_alpha)
	gpu_set_fog(false,-1,0,0);
}


