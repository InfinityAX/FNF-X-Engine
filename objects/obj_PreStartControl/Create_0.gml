RM_X_CEN = room_width/2;
RM_Y_CEN = room_height/2;
var F_MAP_STRING = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";

scp_GameLoggerCreate();
scp_GameInfo_LoadInfo();
scp_WindowResizerAutoSet();
scp_DefaultDataLoader_LoadSysFont();
scp_DefaultFontLoader_MainFontLoad();

/*
var fontDetails = FontControlAddDefSysGMFontLib(ft_defSystem, 1, c_white);
scp_GameLoggerInsertLog("Default Sys Font Successfully added: " + fontDetails);
var fontDetails = FontControlAddDefMainSpriteLib(spr_defMainFont, F_MAP_STRING, true, 0, 1, c_white);
scp_GameLoggerInsertLog("Default Main Font Successfully added: " + fontDetails);
*/
//FontControlAddMainDevOnly();

instance_create_depth(0, 0, 0, obj_WindowNameDisplay);