game_start();
/*insert_log("Loading rm_flashing_state...");

var _flashing_state_p ="TitleState/flashstate.txt";
;

var _r_data = flashimgstate_ini_reader(_flashing_state_p);

flash_font = _r_data[0];
yes_menu_sound = _r_data[1];
no_menu_sound = _r_data[2];
*/

// Desire delta of 1 FPS
target_flashing_speed = 1/20;

enter_pressed = false;
dalpha = 1
timer = 1;

//change_gamespeed_fps(10);

//insert_log("rm_flashing_state loaded.");