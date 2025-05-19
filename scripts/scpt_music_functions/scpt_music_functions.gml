function set_song_ingame(_song, _fadeOutCurrentSong = 0, _fadeIn = 0, _songOverlap = false)
{
	//song                = set to any song (including "noone" to stop or fade the track out)
	//_fadeOutCurrentSong = time (in frames) the current song (if playing) will take to fade out
	//_fadeIn             = time (in frames) the target song (if not "noone") will take to fade in
	//_songOverlap        = should the new song overlap with any old songs playing
	
	with(obj_music_manager)
	{
		target_song_asset = _song;
		endFadeOutTime    = _fadeOutCurrentSong;
		startFadeInTime   = _fadeIn;
		songOverlap       = _songOverlap;
	}
}

function scpt_audio_play_sound(_sfx, _priority = 0, _loop = false)
{
	if (audio_is_playing(_sfx)) audio_stop_sound(_sfx);
	audio_play_sound(_sfx, _priority,_loop);
}