

//Play the target song
if (song_asset != target_song_asset)
{
	//Tell the old song to fade out
	if (audio_is_playing(song_instance))
	{
		//add our song_instance to our array of songs to fade out
		array_push(fadeOutInstances, song_instance)
		//add the song_instance's strarting volume (so there's no abrupt change in volume)
		array_push(fadeOutInstVol, fadeInInstVol);
		//add the fadeOutInstance's fade out frames
		array_push(fadeOutInstTime, endFadeOutTime);
		
		//reset the song_instance and song_asset variables
		song_instance = noone;
		song_asset    = noone;
	}
	
	//Play the song, if the old song has faded out, or if it's supposed to overlap
	if (array_length(fadeOutInstances) == 0 || songOverlap)
	{
		if (audio_exists(target_song_asset))
		{
			//Play the song and store it's instance in a variable
			song_instance = audio_play_sound( target_song_asset, 4, true);
	
			//Start the song's volume at 0
			audio_sound_gain( song_instance, 0, 0);
			fadeInInstVol = 0;
		}
	
		//Set the song_asset to match the target_song_asset
		song_asset  = target_song_asset;
		songOverlap = false;
	}
}

//Volume control
	//Main song colume
	if (audio_is_playing( song_instance ))
	{
		//Fade the song in
		if (startFadeInTime > 0)
		{
			if (fadeInInstVol < 1) { fadeInInstVol += 1/startFadeInTime;} else {fadeInInstVol = 1}
		}
		//Immediately start the song if the fade in time is 0 frames
		else
		{
			fadeInInstVol = 1;
		}
		//Actually set the gain
		audio_sound_gain(song_instance, fadeInInstVol, 0);
	}
	
	//Fading songs out
	for (var i = 0; i < array_length(fadeOutInstances); i++)
	{
		//Fade the volume
		if (fadeOutInstTime[i] > 0)
		{
			if (fadeOutInstVol[i] > 0){fadeOutInstVol[i] -= 1/fadeOutInstTime[i];}
		}
		//immediately cut volume to 0 otherwise
		else
		{
			fadeOutInstVol[i] = 0;
		}
		
		//Actually set the gain
		audio_sound_gain(fadeOutInstances[i], fadeOutInstVol[i], 0)
		
		//stop the song when it's volume is at 0 and remove it from ALL arrays
		if (fadeOutInstVol[i] <= 0)
		{
			//stop the song
			if (audio_is_playing(fadeOutInstances[i])){audio_stop_sound(fadeOutInstances[i]);};
			//remove it from the arrays
			array_delete(fadeOutInstances, i, 1);
			array_delete(fadeOutInstVol, i, 1);
			array_delete(fadeOutInstTime, i, 1);
			//set the loop back 1 since we just deleted an entry
			i--;
		}
	}