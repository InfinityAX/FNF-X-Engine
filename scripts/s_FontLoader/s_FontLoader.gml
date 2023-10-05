globalvar default_system_font;
globalvar default_main_font;
globalvar default_ft_map_str;


function load_default_fonts()
{
	default_ft_map_str = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
	
	if (font_add_get_enable_aa())
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
	}
	
	if (!font_add_get_enable_aa())
	{
		font_add_enable_aa(true);
	}
	
	default_main_font = [font_add_sprite_ext(spr_default_main_font, default_ft_map_str, true, 0), 1, 1, c_white];
	insert_log("spr_defMainFont successfully added as default main font.\nFont map string: " + default_ft_map_str + "\nProp font: True\nFont spacing: 0\nFont X scale: 1\nFont Y scale: 1\nFont colour: White");
	
	return;
}