global.midTransition = false;
global.roomTarget    = -1;

function TransitionPlaceSequence(_type)
{
	if (layer_exists("transition")) layer_destroy("transition");
	var _lay = layer_create(-9999, "transition");
	layer_sequence_create(_lay, 0, 0, _type);
}

function TransitionStart(_roomTagert, _typeOut, _typeIn)
{
	if (!global.midTransition)
	{
		global.midTransition = true;
		global.roomTarget    = _roomTagert;
		TransitionPlaceSequence(_typeOut);
		layer_set_target_room(_roomTagert);
		TransitionPlaceSequence(_typeIn);
		layer_reset_target_room();
		return true;
	}
	else return false
}

function TransitionChangeRoom()
{
	room_goto(global.roomTarget)
}

function TransitionFinished()
{
	layer_sequence_destroy(self.elementID);
	if (instance_exists(obj_par_cutscene))action_end();
	global.midTransition = false;
}