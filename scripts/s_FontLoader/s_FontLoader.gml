globalvar default_system_font;
globalvar default_main_font;
globalvar default_ft_map_str;


// Load the default font from file
function load_font_file(_f_name)
{
	var _font_file_p = "Fonts/fonts.txt";
	
	insert_log("Loading default fonts from file...");
	
	if (!file_exists(_font_file_p))
	{
		insert_log("fonts.txt not found. Loading internal defaults...");
		load_default_fonts(1);
	}
	else
	{
		ini_open(_font_file_p);
	
		insert_log("fonts.txt found, reading data...");
	
		var _font_name = ini_read_string("SYSTEM", "", "");
	
		if (!file_exists("DefaultFonts/" + _font_name))
		{
			insert_log(_font_name + " not found or is blank. Skipping importing from file and loading from internal defaults.");
			load_default_fonts(1);
		}
		else
		{
			_font_name = "DefaultFonts/" + _font_name;
			
			file_text_readln(_ofile);
			var _font_size = file_text_read_real(_ofile);
		
			if (_font_size < 0)
			{
				insert_log("FONT SIZE CAN'T BE LESS THAN 0. Setting size to 0...");
				_font_size = 0;
			}
			else if (_font_size > 36)
			{
				insert_log("WARNING: Setting the font size bigger than 36 is not recommended. We won't stop you, but if aomwrhing breaks, you're the one who fucked up.");
			}
		
			file_text_readln(_ofile);
			var _font_bold = file_text_read_real(_ofile);
		
			if (_font_bold == 0)
			{
				_font_bold = false;	
			}
			else
			{
				_font_bold = true;
			}
		
			file_text_readln(_ofile);
			var _font_italic = file_text_read_real(_ofile);
		
			if (_font_italic == 0)
			{
				_font_italic = false;	
			}
			else
			{
				_font_italic = true;
			}
		
			file_text_readln(_ofile);
			var _font_fchar = file_text_read_real(_ofile);
		
			if (_font_fchar < 0)
			{
				insert_log("FIRST FONT CHARACTER CAN'T BE LESS THAN 0. Setting first font character to 0...");
				_font_fchar = 0;
			}
		
			if (_font_fchar != 32)
			{
				insert_log("WARNING: Setting the first font character a value other than 32 is not recommended. Change it back unless you know what you are doing.");
			}
		
			file_text_readln(_ofile);
			var _font_lchar = file_text_read_real(_ofile);
		
			if (_font_lchar < _font_fchar)
			{
				insert_log("LAST FONT CHARACTER CAN'T BE LESS THAN FIRST FONT CHARACTER. Setting first font character to " + string(_font_fchar) + "...");
				_font_lchar = _font_fchar;
			}
		
			if (_font_lchar != 128)
			{
				insert_log("WARNING: Setting the last font character a value other than 128 is not recommended. Change it back unless you know what you are doing.");
			}
		
			file_text_readln(_ofile);
			var _font_aa = file_text_read_real(_ofile);
		
			if (_font_aa == 0)
			{
				_font_aa = false;
			}
			else
			{
				_font_aa = true;
			}
		
			font_add_enable_aa(_font_aa);
			file_text_readln(_ofile);
			var _font_x_scale = file_text_read_real(_ofile);
		
			if (_font_x_scale < 0)
			{
				insert_log("FONT X SCALE CAN'T BE LESS THAN 0. Setting font x scale to 0...");
				_font_x_scale = 0;
			}
		
			if (_font_x_scale > 5)
			{
				insert_log("WARNING: Setting the font x scale to a large value is not recommended. If you computer explodes, you have yourself to blame.");
			}
		
			file_text_readln(_ofile);
			var _font_y_scale = file_text_read_real(_ofile);
		
			if (_font_y_scale < 0)
			{
				insert_log("FONT Y SCALE CAN'T BE LESS THAN 0. Setting font x scale to 0...");
				_font_y_scale = 0;
			}
		
			if (_font_y_scale > 5)
			{
				insert_log("WARNING: Setting the font y scale to a large value is not recommended. If you computer explodes, you have yourself to blame.");
			}
		
			file_text_readln(_ofile);
			var _font_colour = file_text_read_string(_ofile);
		
			_font_colour = string_parce_colour(_font_colour);
		
			default_system_font = [font_add(_font_name, _font_size, _font_bold, _font_italic, _font_fchar, _font_lchar), _font_x_scale, _font_y_scale, _font_colour[0]];
		
			insert_log("Font " + _font_name + " successfully added as default system font.\nFont size: " + string(_font_size) + "\nBolded font: " + string(_font_bold) + "\nItalic font: " + string(_font_italic) + "\nFirst font character: " + string(_font_fchar) + "\nLast font character: " + string(_font_lchar) + "\nFont x scale: " + string(_font_x_scale) + "\nFont y scale: " + string(_font_y_scale) + "\nFont colour: " + _font_colour[1] + "\nFont AA: " + string(_font_aa));
		}
		
		file_text_close(_ofile);
	}
	
	load_default_fonts(2);
	//load_default_fonts(3);
	
	
	
	return;
}


// Load the default internal fonts
function load_default_fonts(_val)
{
	default_ft_map_str = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
	
	font_add_enable_aa(true);
	
	if (_val <= 0)
	{
		insert_log("Default internal system font loaded.");
		return [fnt_debug, 1, 1, c_white];
	}
	else
	{
		default_main_font = [font_add_sprite_ext(spr_menu, default_ft_map_str, true, 0), 1, 1, c_white];
		insert_log("Default internal main font loaded.");
		return;
		//insert_log("spr_defMainFont successfully added as default main font.\nFont map string: " + default_ft_map_str + "\nProp font: True\nFont spacing: 0\nFont X scale: 1\nFont Y scale: 1\nFont colour: White");
	}
	
	/*if (font_add_get_enable_aa())
	{
		font_add_enable_aa(false);
	}
	
	if (file_exists("Fonts/DEC.ttf"))
	{
		default_system_font = [font_add("Fonts/DEC.ttf", 20, false, false, 32, 128), 2, 1.5, c_white];
		insert_log("DEC.ttf successfully added as default system font.\nFont size: 20\nBold font: False\nItalic font: False\nFont X scale: 1\nFont Y scale: 1\nFont colour: White");
	}
	else
	{
		insert_log("FATAL ERROR: DEC.ttf font file is needed for the engine to run.");
		game_end();
	}*/
}