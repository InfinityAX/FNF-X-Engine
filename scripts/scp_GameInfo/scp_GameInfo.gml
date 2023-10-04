globalvar modInfo;


// Loads the game info from file.
function scp_GameInfo_LoadInfo()
{
	if (!file_exists("ModInfo.txt"))
	{
		scp_GameLoggerInsertLog("ERROR: ModInfo.txt not found. Loading default game info...");
		scp_DefaultDataLoader_LoadInfo();
		return;
	}
	
	var fileOpened = file_text_open_read("ModInfo.txt");
	
	for (var i = 0; i < 3; i++)
	{
		modInfo[i] = scp_StringChecker_Grab(file_text_read_string(fileOpened));
		file_text_readln(fileOpened);
	}
	
	file_text_close(fileOpened);
	scp_GameLoggerInsertLog("Mod info successfully loaded.\nMod name: " + modInfo[0] + "\nMod version: " + modInfo[1] + "\nMod description: " + modInfo[2]);
}