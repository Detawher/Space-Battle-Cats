// Inherit the parent event
event_inherited();
if (_id != noone)
{
	if (!instance_exists(_id))
	{
		instance_destroy();
	}
}
