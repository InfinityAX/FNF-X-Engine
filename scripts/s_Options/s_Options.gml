// GRAPHICS
globalvar graphics_quality;
globalvar flashing_lights;
//GAME UI
globalvar fps_counter_d;


// Load from the options file if possible
function load_options()
{
	insert_log("Start of options loading.");
	
	if (file_exists("gameOPTIONS.txt"))
	{
		insert_log("gameOPTIONS.txt found, reading file...");
		
		ini_open("gameOPTIONS.txt");
		
		if (!ini_section_exists("GRAPHICS") or !ini_section_exists("GAME UI"))
		{
			insert_log("gameOPTIONS.txt->GRAPHICS|GAME UI not found, loading default options...");
			
			set_default_options();
			ini_write_real("GRAPHICS", "QUALITY", graphics_quality);
			ini_write_real("GRAPHICS", "FLASHING", flashing_lights);
			ini_write_real("GAME UI", "FPS COUNTER", fps_counter_d);
		}
		else
		{
			if (!ini_key_exists("GRAPHICS", "QUALITY") or !ini_key_exists("GRAPHICS", "FLASHING") or !ini_key_exists("GAME UI", "FPS COUNTER"))
			{
				insert_log("Item(s) in gameOPTIONS.txt->GRAPHICS|GAME UI not found, loading default options...");
				
				set_default_options();
				ini_write_real("GRAPHICS", "QUALITY", graphics_quality);
				ini_write_real("GRAPHICS", "FLASHING", flashing_lights);
				ini_write_real("GAME UI", "FPS COUNTER", fps_counter_d);
			}
			else
			{
				graphics_quality = ini_read_real("GRAPHICS", "QUALITY", 0);
				flashing_lights = ini_read_real("GRAPHICS", "FLASHING", -1);
				fps_counter_d = ini_read_real("GAME UI", "FPS COUNTER", 1);
				
				insert_log("Options loading success.");
			}
		}
	}
	else
	{
		insert_log("gameOPTIONS.txt not found, creating new file and loading default options...");
		
		ini_open("gameOPTIONS.txt");
		set_default_options();
		ini_write_real("GRAPHICS", "QUALITY", graphics_quality);
		ini_write_real("GRAPHICS", "FLASHING", flashing_lights);
		ini_write_real("GAME UI", "FPS COUNTER", fps_counter_d);
	}
	
	ini_close();
	
	insert_log("End of options loading.");
	
	return;
}


// Set the default options
function set_default_options()
{
	graphics_quality = 0;
	flashing_lights = -1;
	fps_counter_d = 1;
	
	insert_log("Default options loaded.");
	
	return;
}


// Set the flashing option based on the value recived in rm_flashing_state
function set_option_flashing(_val)
{
	flashing_lights = _val;
	
	if (_val == 0)
	{
		insert_log("Flashing lights set to off.");
	}
	else
	{
		insert_log("Flashing lights set to on/undetermined.");
	}
	
	ini_open("gameOPTIONS.txt");
	ini_write_real("GRAPHICS", "FLASHING", _val);
	ini_close();
	
	insert_log("Flashing lights set option saved.");
	
	return;
}