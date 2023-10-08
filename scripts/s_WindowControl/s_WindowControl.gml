globalvar _minfo;

// Loads the default game info.
/*
function load_window_title()
{
	_minfo = ["FNF X Engine", "B", "Another tool to make FNF mods I guess."];
	insert_log("Default mod info loaded successfully.\nMod name: " + _minfo[0] + "\nMod version: " + _minfo[1] + "\nMod Description: " + _minfo[2]);
	
	return;

}*/


// Set the default game window parameters
function auto_window_control()
{
	insert_log("Automatically adjusting game window...");
	
	var _dwidth = display_get_width();
	var _dheight = display_get_height();
	var _windowheight;
	var _windowwidth;
	
	insert_log("Detected display size: " + string(_dwidth) + "*" + string(_dheight) + "...");
	
	if (_dwidth > 3840 and _dheight > 2160)
	{
		_windowheight = 2160;
		_windowwidth = 3840;
	}
	else if (_dwidth > 2560 and _dheight > 1440)
	{
		_windowheight = 1440;
		_windowwidth = 2560;
	}
	else if (_dwidth > 1920 and _dheight > 1080)
	{
		_windowheight = 1080;
		_windowwidth = 1920;
	}
	else if (_dwidth > 1600 and _dheight > 900)
	{
		_windowheight = 900;
		_windowwidth = 1600;
	}
	else
	{
		_windowheight = 720;
		_windowwidth = 1280;
	}
	
	var _xpos = (_dwidth / 2) - (_windowwidth/2);
	var _ypos = (_dheight / 2) - (_windowheight/2);
	
	manual_window_resizw(_windowwidth, _windowheight, _xpos, _ypos);
	change_gamespeed_fps(60);
	
	insert_log("Auto game window adjustments complete.");
	
	return;
}


// Toggles the fullscreen
function full_screen_toggle()
{
	insert_log("Toggling fullscreen...");
	
	if (!window_get_fullscreen())
	{
		window_set_fullscreen(true);
		
		insert_log("Fullscreen Enabled");
	}
	else
	{
		window_set_fullscreen(false);
		
		insert_log("Fullscreen Disabled");
	}
	
	return;
}


// Changes the game speed in FPS
function change_gamespeed_fps(_fps_val)
{
	insert_log("Setting game speed in FPS...");
	
	game_set_speed(_fps_val, gamespeed_fps);
	
	insert_log("Gamespeed set to " + string(_fps_val) + "FPS.");
	
	return;
}


// Resizes the game window size and position
function manual_window_resizw(_wwidth, _wheight, _xpos, _ypos)
{
	var _dwidth = display_get_width();
	var _dheight = display_get_height();
	
	insert_log("Resizing game window...");
	
	if (_wwidth < 0)
	{
		insert_log("WINDOW WIDTH CAN'T BE LESS THAN 0. Setting value to 0...");
		
		_wwidth = 0;
	}
	
	if (_wwidth > _dwidth)
	{
		insert_log("WINDOW WIDTH CAN'T BE LARGER THAN THE DISPLAY WIDTH. Setting value to " + string(_dwidth) +"...");
		
		_wwidth = _dwidth;
	}
	
	if (_wheight < 0)
	{
		insert_log("WINDOW HEIGHT CAN'T BE LESS THAN 0. Setting value to 0...");
		
		_wheight = 0;
	}
	
	if (_wheight > _dheight)
	{
		insert_log("WINDOW HEIGHT CAN'T BE LARGER THAN THE DISPLAY HEIGHT. Setting value to " + string(_dheight) +"...");
		
		_wheight = _dheight;
	}
	
	if (_xpos < 0)
	{
		insert_log("WINDOW X POSITION CAN'T BE LESS THAN 0. Setting value to 0...");
		
		_xpos = 0;
	}
	
	if (_xpos > (_dwidth - _wwidth))
	{
		_xpos = _dwidth - _wwidth;
		
		insert_log("WINDOW X POSITION CAN'T BE LARGER THAN THE DISPLAY WIDTH MINUS WINDOW WIDTH. Setting value to " + string(_xpos) +"...");
	}
	
	if (_ypos < 0)
	{
		insert_log("WINDOW Y POSITION CAN'T BE LESS THAN 0. Setting value to 0...");
		
		_ypos = 0;
	}
	
	if (_ypos > (_dheight - _wheight))
	{
		_ypos = _dheight - _wheight;
		
		insert_log("WINDOW Y POSITION CAN'T BE LARGER THAN THE DISPLAY HEIGHT MINUS WINDOW HEIGHT. Setting value to " + string(_ypos) +"...");
	}
	
	window_set_rectangle(_xpos, _ypos, _wwidth, _wheight);
	
	insert_log("Window size set to " + string(_wwidth) + "*" + string(_wheight) + " and positioned at (" + string(_xpos) + ", " + string(_ypos) + ") from top left corner.");
	
	return;
}