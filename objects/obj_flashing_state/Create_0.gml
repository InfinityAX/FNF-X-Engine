insert_log("Loading rm_flashing_state...");

var _flashing_state_p ="TitleState/flashstate.txt";
dalpha = 1;
enter_pressed = false;
var _r_data = flashimgstate_ini_reader(_flashing_state_p);

flash_font = _r_data[0];
yes_menu_sound = _r_data[1];
no_menu_sound = _r_data[2];

change_gamespeed_fps(10);

insert_log("rm_flashing_state loaded.");