//Info for the sond we are currently playing / trying to play
song_instance	  = noone;
song_asset		  = noone;
target_song_asset = noone;
endFadeOutTime    = 0;//how many frames to fade out the song currently playing
startFadeInTime   = 0;//how many frames to fade in the new song
fadeInInstVol     = 1;//the volume of song_instance

//for fading music out and stopping songs that are no longer playing
fadeOutInstances  = array_create(0);//the audio instances to fade out
fadeOutInstVol    = array_create(0);//the volumes of each individual audio instance
fadeOutInstTime   = array_create(0);//how fast the fadeout should happen

songOverlap       = false;