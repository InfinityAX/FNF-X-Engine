insert_log("Key escape press detected.");

set_flashing(1);

insert_log("Flashing set to on.");

audio_play_sound(snd_sfx_default_menu_cancel, 0, false);

insert_log("Playing sound \"snd_sfx_default_menu_cancel\"...");
insert_log("Going to rm_title_state...");

room_goto(rm_title_state);