// Loads the default system font info.
function scp_DefaultDataLoader_LoadSysFont()
{
	if (font_add_get_enable_aa())
	{
		font_add_enable_aa(false);
	}
	
	if (file_exists("Fonts/DEC.ttf"))
	{
		defSystemFont = [font_add("Fonts/DEC.ttf", 20, false, false, 32, 128), 2, 1.5, c_white];
		defSystemFontOR = defSystemFont;
		scp_GameLoggerInsertLog("DEC.ttf successfully added as default system font.\nFont size: 20\nBold font: False\nItalic font: False\nFont X scale: 1\nFont Y scale: 1\nFont colour: White");
	}
	else
	{
		scp_GameLoggerInsertLog("FATAL ERROR: DEC.ttf font file is needed for the engine to run.");
		game_end();
	}
}


// Loads the default main font info.
function scp_DefaultDataLoader_LoadMainFont()
{
	var F_MAP_STRING = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
	
	if (font_add_get_enable_aa())
	{
		font_add_enable_aa(false);
	}
	
	defMainFont = [font_add_sprite_ext(spr_defMainFont, F_MAP_STRING, true, 0), 1, 1, c_white];
	defMainFontOR = defMainFont;
	scp_GameLoggerInsertLog("spr_defMainFont successfully added as default main font.\nFont map string: " + F_MAP_STRING + "\nProp font: True\nFont spacing: 0\nFont X scale: 1\nFont Y scale: 1\nFont colour: White");
}


// Loads the default game info.
function scp_DefaultDataLoader_LoadInfo()
{
	modInfo = ["FNF X Engine", "A", "Another tool to make FNF mods I guess."];
	scp_GameLoggerInsertLog("Default mod info loaded successfully.\nMod name: " + modInfo[0] + "\nMod version: " + modInfo[1] + "\nMod Description: " + modInfo[2]);
}