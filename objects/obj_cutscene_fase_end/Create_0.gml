// Inherit the parent event
event_inherited();

switch(room)
{
	case rm_fase1:
			_room_goto = rm_fase2;
			_seq_close = seq_close;
			_seq_open  = seq_open;
	break;
	case rm_fase2:
			_room_goto = rm_fase3;
			_seq_close = seq_close;
			_seq_open  = seq_open;
	break;
	case rm_fase3:
			_room_goto = rm_fase4;
			_seq_close = seq_close;
			_seq_open  = seq_open;
	break;
	case rm_fase4:
			_room_goto = rm_fase5;
			_seq_close = seq_close;
			_seq_open  = seq_open;
	break;
	case rm_fase5:
			_room_goto = rm_fase6;
			_seq_close = seq_close_2;
			_seq_open  = seq_open_2;
	break;
}



cutscene = 
		[
		[cutscene_wait, 2],
		[cutscene_move_character, obj_player, 0, 5, true, 1],
		[cutscene_move_character, obj_player, 0, -240, true, 2],
		[cutscene_change_room, _room_goto, _seq_close, _seq_open]
		]
		
		
		