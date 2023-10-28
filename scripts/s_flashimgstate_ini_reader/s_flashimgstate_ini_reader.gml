// Loads data from the ini file for the flashing state
function flashimgstate_ini_reader(_nfile)
{
	var _r_array = [load_default_fonts(0), -1, -1];
	
	if (!file_exists(_nfile))
	{
		insert_log(_nfile + "not found. Using internal defaults...");
	}
	else
	{
		insert_log("Loading data from " + _nfile + "...");
		ini_open(_nfile);
		
		if (!ini_section_exists("FONT"))
		{
			insert_log("Section \"FONT\" not found. Using default font...");
		}
		else
		{
			if (!ini_key_exists("FONT", "FONT0"))
			{
				insert_log("Section \"FONT\" key \"FONT0\" not found. Using default font...");
			}
			else
			{
				// Stay tune for a randomizer update
				
				var _n_f = ini_read_string("FONT", "FONT0", "");
				
				if (_n_f == "")
				{
					insert_log("Font name is empty. Using default font...");
				}
				else
				{
					insert_log("Loading font " + _n_f + "...");
					_r_array[0] = load_font_file(_n_f);
				}
			}
		}
		/*
		if (!ini_section_exists("CONFIRM SOUND"))
		{
			insert_log("Section \"CONFIRM SOUND\" not found. Using default confirm sound...");
		}
		else
		{
			if (!ini_key_exists("CONFIRM SOUND", "CONFIRM_SOUND0"))
			{
				insert_log("Section \"CONFIRM SOUND\" key \"CONFIRM_SOUND0\" not found. Using default font...");
			}
			else
			{
				// Stay tune for a randomizer update
				
				var _n_s = ini_read_string("CONFIRM SOUND", "CONFIRM_SOUND0", "");
				
				if (_n_s == "")
				{
					insert_log("Confirm sound name is empty. Using default confirm sound...");
				}
				else
				{
					insert_log("Loading confirm sound " + _n_s + "...");
					//_r_array[0] = load_font_file(_n_s);
				}
			}
		}*/
	}
	
	return _r_array;
}