globalvar graphics_quality;
globalvar flashing_lights;


function load_options()
{
	insert_log("Start of options loading.");
	
	if (file_exists("gameOPTIONS"))
	{
		insert_log("gameOPTIONS found, reading file...");
		
		ini_open("gameOPTIONS");
		
		if (!ini_section_exists("GRAPHICS"))
		{
			insert_log("gameOPTIONS->GRAPHICS not found, loading default options...");
			
			set_default_options();
			ini_write_real("GRAPHICS", "QUALITY", graphics_quality);
		}
		else
		{
			if (!ini_key_exists("GRAPHICS", "QUALITY") or !ini_key_exists("GRAPHICS", "FLASHING"))
			{
				insert_log("gameOPTIONS->GRAPHICS->QUALITY|FLASHING not found, loading default options...");
				
				set_default_options();
				ini_write_real("GRAPHICS", "QUALITY", graphics_quality);
			}
			else
			{
				graphics_quality = ini_read_real("GRAPHICS", "QUALITY", 0);
				flashing_lights = ini_read_real("GRAPHICS", "FLASHING", -1);
				
				insert_log("Options loading success.");
			}
		}
	}
	else
	{
		insert_log("gameOPTIONS not found, creating new file and loading default options...");
		
		ini_open("gameOPTIONS");
		set_default_options();
		ini_write_real("GRAPHICS", "QUALITY", graphics_quality);
	}
	
	ini_close();
	
	insert_log("End of options loading.");
	
	return;
}


function set_default_options()
{
	graphics_quality = 0;
	flashing_lights = -1;
	
	insert_log("Defailt options loaded.");
	
	return;
}


// Set the flashing option based on the value recived in rm_flashing_state
function set_flashing(_val)
{
	flashing_lights = _val;
	ini_open("gameOPTIONS");
	ini_write_real("GRAPHICS", "FLASHING", _val);
	ini_close();
	
	return;
}