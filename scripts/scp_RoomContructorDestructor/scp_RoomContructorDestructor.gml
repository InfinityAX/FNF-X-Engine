// Setup the room window
function roomSetUpDefault()
{
	view_enabled = true;
	view_visible[0] = true;
	view_xport[0] = 0;
	view_yport[0] = 0;
	view_wport[0] = 1280;
	view_hport[0] = 720;

	view_camera[0] = camera_create_view(0, 0, 1280, 720);
	
	surface_resize(application_surface, 1280, 720);
}


function autoWindowSize()
{
	var _dwidth = display_get_width();
	var _dheight = display_get_height();
	var _xpos = (_dwidth / 2);
	var _ypos = (_dheight / 2);
	
	if (_dwidth > 3840 and _dheight > 2160)
	{
		var _windowheight = 2160;
		var _windowwidth = 3840;
	}
	else if (_dwidth > 2560 and _dheight > 1440)
	{
		var _windowheight = 1440;
		var _windowwidth = 2560;
	}
	else if (_dwidth > 1920 and _dheight > 1080)
	{
		var _windowheight = 1080;
		var _windowwidth = 1920;
	}
	else if (_dwidth > 1600 and _dheight > 900)
	{
		var _windowheight = 900;
		var _windowwidth = 1600;
	}
	else
	{
		var _windowheight = 720;
		var _windowwidth = 1280;
	}
	
	window_set_rectangle(_xpos-(_windowwidth/2), _ypos-(_windowheight/2), _windowwidth, _windowheight);
}