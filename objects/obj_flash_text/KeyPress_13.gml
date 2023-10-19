insert_log("Key enter press detected.");

set_option_flashing(1);

if (yes_sound == "")
{
	insert_log("Flash text object deleted.");
	instance_destroy(self);
}
//audio_play_sound(snd_sfx_default_menu_yes, 0, false);

//insert_log("Playing sound \"snd_sfx_default_menu_yes\"...");

//alarm_set(0, game_get_speed(gamespeed_fps));

//insert_log("Alarm 0 set to " + string(game_get_speed(gamespeed_fps)) + " game frames.");