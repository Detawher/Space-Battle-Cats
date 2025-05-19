
if (!_under) _under = instance_create_depth(385, 194, 10 + depth, obj_loop, {sprite_index : spr_painel_under})

var _pata = point_in_rectangle(mouse_x,mouse_y,x,y,x+82,y+68);

if(_pata)
{
	desenha_pata = true;
}
else
{
	desenha_pata = false;
}


