// Inherit the parent event
event_inherited();



cutscene = 
		[
		[cutscene_wait, 5],
		[cutscene_create_dialogo, "boss_fim"],
		[cutscene_change_room, rm_credits, seq_close_2, seq_open_2]
		]
		
		
		