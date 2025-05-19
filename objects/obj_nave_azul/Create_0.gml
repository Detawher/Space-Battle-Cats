// Inherit the parent event
event_inherited();
vida = 4;

sprites = [
	[spr_nave_azul]
]

x = 240;

_laser = undefined

perde_vida = function(_qnt = 1)
{
	if (timer_invencivel > 0) return;
	if (vida >= 1)
	{
		vida -= _qnt
	}
	if (vida <= 0)
	{
		var _vfx = instance_create_depth(x-121,y,depth-1,obj_vfx);
		_vfx.sprite_index = choose(spr_hit7,spr_hit10);
		var _vfx = instance_create_depth(x+121,y,depth-1,obj_vfx);
		_vfx.sprite_index = choose(spr_hit7,spr_hit10);
		instance_destroy();
	}
	timer_invencivel = tempo_invencivel;
}

estado_movendo = function()
{
	ajusta_sprite(sprites_index);
	
	if (!_laser)_laser = instance_create_layer(x, y,"Inimigos", obj_nave_azul_laser) _laser._id = id;
	
	var _nave, _nave_2;
	_nave   = collision_rectangle(x-130, y+12, x-113, y-1, obj_bullet_laser, false, true);
	_nave_2 = collision_rectangle(x+112, y+12, x+129, y-1, obj_bullet_laser, false, true); 
	
	if (_nave != noone or _nave_2 != noone)
	{
		perde_vida();
	}
	
	vspeed = .3;
}

estado = estado_movendo;