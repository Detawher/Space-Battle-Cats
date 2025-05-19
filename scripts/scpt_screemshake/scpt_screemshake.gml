function screenshake(_treme = 1,_vel = .1)
{
	if (instance_exists(obj_screemshake))
	{
		with(obj_screemshake)
		{
			if (_treme > treme)
			{
				treme = _treme;
			}
			vel = _vel;
		}
	}
}