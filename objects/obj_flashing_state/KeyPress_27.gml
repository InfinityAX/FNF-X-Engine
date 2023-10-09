insert_log("Key escape press detected.");

set_option_flashing(0);

audio_play_sound(snd_sfx_default_menu_cancel, 0, false);

insert_log("Playing sound \"snd_sfx_default_menu_cancel\"...");

alarm_set(1, game_get_speed(gamespeed_fps));

insert_log("Alarm 1 set to " + string(game_get_speed(gamespeed_fps)) + " game frames.");