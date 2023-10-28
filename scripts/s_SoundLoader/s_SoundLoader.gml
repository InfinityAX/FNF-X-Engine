// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function load_sound(_sound_name)
{
	//audio_create_stream()
	
	//audio_play_sound()
}


// Gets the default sounds
function load_default_sound(_val)
{
	if (_val <= 0)
	{
		insert_log("Default internal confirm menu sound loaded.");
		return snd_sfx_confirm_menu;
	}
	else if (_val == 1)
	{
		insert_log("Default internal cancel menu sound loaded.");
		return snd_sfx_cancel_menu;
	}
	
	return;
}