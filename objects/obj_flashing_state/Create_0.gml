insert_log("Loading rm_flashing_state...");

var _flashing_state_p ="TitleState/flashstate.txt";
flash_font = [fnt_default_system_font, 1, 1, c_white];
yes_menu_sound = "";
no_menu_sound = "";

if (file_exists(_flashing_state_p))
{
	
}
else
{
	insert_log(_flashing_state_p + "not found. Loading defaults");
}

flashstruct = {t_font : flash_font, yes_sound : yes_menu_sound, no_sound : no_menu_sound};

instance_create_depth(0, 0, 0, obj_flash_text, flashstruct);

change_gamespeed_fps(10);

insert_log("rm_flashing_state loaded.");