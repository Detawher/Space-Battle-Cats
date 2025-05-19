if (global.parar == false){
var _col = instance_place(x + velh, y, _obj_colision);

if (_col)
{
	if (velh > 0)
	{
		x = _col.bbox_left + (x - bbox_right);
	}
	if (velh < 0)
	{
		x = _col.bbox_right + (x - bbox_left);
	}
	velh = 0;
}

x += velh;

var _coll = instance_place(x, y + velv, _obj_colision);
if (_coll)
{
	if (velv > 0)
	{
		y = _coll.bbox_top + (y - bbox_bottom);
	}
	if (velv < 0)
	{
		y = _coll.bbox_bottom + (y - bbox_top);
	}
	velv = 0;
}

y += velv;
}