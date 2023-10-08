globalvar _minfo;

// Loads the default game info.
function load_window_title()
{
	_minfo = ["FNF X Engine", "B", "Another tool to make FNF mods I guess."];
	insert_log("Default mod info loaded successfully.\nMod name: " + _minfo[0] + "\nMod version: " + _minfo[1] + "\nMod Description: " + _minfo[2]);
	
	return;

}


function auto_window_control()
{
	var _dwidth = display_get_width();
	var _dheight = display_get_height();
	var _xpos = (_dwidth / 2);
	var _ypos = (_dheight / 2);
	var _windowheight;
	var _windowwidth;
	
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
	
	window_set_rectangle(_xpos-(_windowwidth/2), _ypos-(_windowheight/2), _windowwidth, _windowheight);
	insert_log("Game window set to " + string(_windowwidth) + "*" + string(_windowheight) + ".");
	
	return;
}


function full_screen_toggle()
{
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


function change_gamespeed_fps(_fps_val)
{
	game_set_speed(_fps_val, gamespeed_fps);
	insert_log("Gamespeed set to " + string(_fps_val) + "FPS.");
	return;
}


/*
function manual_window_resizw(_wwidth, _wheight)
{
	var _dwidth = display_get_width();
	var _dheight = display_get_height();
	var _xpos = (_dwidth / 2);
	var _ypos = (_dheight / 2);
	
	if (_wwidth < 0)
	{
		_wwidth = 0;
	}
	
	if (_wwidth > _dwidth)
	{
		_wwidth = _dwidth;
	}
	
	if (_wheight < 0)
	{
		_wheight = 0;
	}
	
	if (_wheight > _dheight)
	{
		_wheight = _dheight;
	}
	
	window_set_rectangle(_xpos-(_wwidth/2), _ypos-(_wheight/2), _wwidth, _wheight);
	
	return;
}


function manual_window_reposition(_xpos, _ypos)
{
	var _dwidth = display_get_width();
	var _dheight = display_get_height();
	var _wwidth = window_get_width();
	var _wheight = window_get_height();
	
	if (_xpos < 0)
	{
		-_xpos = 0;
	}
	
	if (_xpos > (_dwidth - _wwidth))
	{
		_xpos = _dwidth - _wwidth;
	}
	
	if (_ypos < 0)
	{
		_ypos = 0;
	}
	
	if (_ypos > (_dheight - _wheight))
	{
		_ypos = _dheight - _wheight;
	}
	
	window_set_rectangle(_xpos-(_wwidth/2), _ypos-(_wheight/2), _wwidth, _wheight);
	
	return;
}*/