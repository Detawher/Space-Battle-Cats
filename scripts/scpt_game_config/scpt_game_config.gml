global.game_settings = {};

with(global.game_settings)
{
	view = 0;
	view_cam         = noone;
	game_width       = 480;
	game_height      = 270;
	window_width_2   = 1280;
	window_height_2  = 720;
	// Calcula a escala para manter o aspecto pixel perfect
	window_scale = min(window_width_2 div game_width, window_height_2 div game_height);
	gui_width        = game_width  * window_scale;
	gui_height       = game_height * window_scale;
	window_caption   = "Space Battle Cats";
	window_width     = game_width  * window_scale;
	window_height    = game_height * window_scale;
	
	start_fullscreen = false;
	cursor_visible   = false;
	room_start       = rm_title;
}

function game_init()
{
	randomize();
	//iniciando as globais de config
	global._numb = 0;
	global.font_pixel   = font_add_sprite_ext(spr_fonte, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzÀÁÂÃÇÉÊÍÒÓÔÕÚàáâãçéêíòóôõú!'()+,-_@./%;:=?0123456789", true, 1)
	//Iniciando os grupos de audio
	//audio_group_load(audiogroup_sound_effect);
	audio_group_load(audiogroup_music);
	
	//Iniciando os macros
	
	//Instanciando os objetos do começo
	instance_create_layer(0, 0, "Superior", obj_game_controller);
	instance_create_layer(0, 0, "Superior", obj_window_manager);
	instance_create_layer(0, 0, "Superior", obj_music_manager);
	var _screem = instance_create_layer(0, 0, "Superior", obj_screemshake);
	_screem.treme = 0;
	
	room_goto(global.game_settings.room_start);
}

function game_set_window()
{
	//setando a visibilidade do cursor
	if(!global.game_settings.cursor_visible) window_set_cursor(cr_none);
	cursor_sprite = spr_cursor;
	//setando no nome acima da janela
	window_set_caption(global.game_settings.window_caption);
	
	//setando o tamanho da janela
	window_set_size(global.game_settings.window_width,global.game_settings.window_height)
	
	//setando o tamanho da surface
	//surface_resize(application_surface, global.game_settings.window_width, global.game_settings.window_height);
	surface_resize(application_surface, global.game_settings.game_width, global.game_settings.game_height);
	
	//setando o tamanho da GUI
	display_set_gui_size(global.game_settings.gui_width, global.game_settings.gui_height);
	
	//setando a janela no meio do monitor
	var _time_source_window_center = time_source_create(time_source_game, 1, time_source_units_frames, window_center);
	time_source_start(_time_source_window_center);
	
	//setando a possibilidade da tela cheia
	var _window_set_fullscreen = function()
	{
		window_set_fullscreen(global.game_settings.start_fullscreen);
	}
	var _time_source_window_fullscreen = time_source_create(time_source_game, 1, time_source_units_frames, _window_set_fullscreen);
	time_source_start(_time_source_window_fullscreen);
}

function game_enable_view_port()
{
	global.game_settings.view_cam = view_camera[global.game_settings.view];
	view_enabled = true;
	view_visible[global.game_settings.view] = true;
	camera_set_view_size(global.game_settings.view_cam, global.game_settings.game_width, global.game_settings.game_height);
}

function game_toggle_fullscreen()
{
	if (window_get_fullscreen())
	{
		window_set_fullscreen(false);
	} else
	{
		window_set_fullscreen(true);
	}
}