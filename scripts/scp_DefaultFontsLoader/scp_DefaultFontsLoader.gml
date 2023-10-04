// Load the default main font from file.
function scp_DefaultFontLoader_MainFontLoad()
{
	if (!file_exists("PreStart/defMainGameWideOverride.txt"))
	{
		scp_GameLoggerInsertLog("defMainGameWideOverride.txt not found. Loading default main font...");
		scp_DefaultDataLoader_LoadMainFont();
		return;
	}
	
	var loadedData;
	var fileOpened = file_text_open_read("PreStart/defMainGameWideOverride.txt");
	
	for (var i = 0; i < 16; i++)
	{
		loadedData[i] = scp_StringChecker_Grab(file_text_read_string(fileOpened));
		file_text_readln(fileOpened);
	}
	
	file_text_close(fileOpened);
	
	loadedData[1] = scp_StringChecker_BooleanConvert(loadedData[1]);
	loadedData[9] = scp_StringChecker_BooleanConvert(loadedData[9]);
	loadedData[10] = scp_StringChecker_UnsignIntConvert(loadedData[10]);
	loadedData[11] = scp_StringChecker_BooleanConvert(loadedData[11]);
	loadedData[12] = scp_StringChecker_BooleanConvert(loadedData[12]);
	loadedData[15] = scp_StringChecker_ColourConvert(loadedData[15]);
	
	//scp_GameLoggerInsertLog("FATAL ERROR: DEC.ttf font file is needed for the engine to run.");
}