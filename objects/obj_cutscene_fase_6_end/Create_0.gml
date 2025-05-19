// Inherit the parent event
event_inherited();



cutscene = 
		[
		[cutscene_wait, 2],
		[cutscene_create_dialogo, "sala_6_fim"],
		[cutscene_move_character, obj_player, 0, 5, true, 1],
		[cutscene_move_character, obj_player, 0, -240, true, 2],
		[cutscene_change_room, rm_game_boss, seq_close_2, seq_open_2]
		]
		
		
		