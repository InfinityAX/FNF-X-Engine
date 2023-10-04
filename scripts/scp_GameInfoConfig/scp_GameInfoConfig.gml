globalvar flashingWarningSeen;
globalvar preStartIntroSeen;

avaliable_setting_type = ["CONTROLS", "UI", "GAMEPLAY"];
keybind_options = ["ASWD", "ZX,.", "ASKL", "DFJK", "QWOP", "WEIO", "SDJK"];
userSettings =	[
					["CONTROLS", "Note Keybind", 0],
					["UI", "Allow Flashing", 0], ["UI", "Display FPS", 0], ["UI", "Show Streak Count", 0], ["UI", "Show Rating Details", 0], ["UI", "Show Time Remaining", 0], ["UI", "Note Splash Effect", 0],
					["GAMEPLAY", "Mute on Miss", 0], ["GAMEPLAY", "Miss SFX", 0]
				];


//	Loads user settings from file.
function load_user_settings()
{
	ini_open("userSettings.ini");
	flashingWarningSeen = ini_read_real("NULL", "WarningSeen", 0);
	
	for (var i = 0; i < array_length(userSettings); i++)
	{
		if (userSettings[i][0] != "CONTROLS")
		{
			userSettings[i][2] = ini_read_real(userSettings[i][0], userSettings[i][1], 0);
			
			if (userSettings[i][2] >= 1)
			{
				userSettings[i][2] = 1;
			}
			else
			{
				userSettings[i][2] = 0;
			}
		}
		else
		{
			userSettings[i][2] = ini_read_real(userSettings[i][0], userSettings[i][1], 0);
			
			if (userSettings[i][2] < 0 or userSettings[i][2] >= array_length(keybind_options))
			{
				userSettings[i][2] = 0;
			}
		}
	}
	
	ini_close();
}


//	Get the specific user setting.
function get_user_settings(settingName)
{
	var returnedIndex = user_settings_index(settingName);
	return userSettings[returnedIndex][2];
}


//	Get selected keybind.
function keybind_get()
{
	var keybind_index = user_settings_index("Note Keybind");
	return keybind_options[userSettings[keybind_index][2]];
}


//	Toggle the specified user setting.
function toggle_user_settings(settingName)
{
	ini_open("userSettings.ini");
	var returnedIndex = user_settings_index(settingName);
	
	if (settingName == "Note Keybind")
	{
		if (userSettings[returnedIndex][2] + 1 >= array_length(keybind_options))
		{
			userSettings[returnedIndex][2] = 0;
		}
		else
		{
			userSettings[returnedIndex][2] += 1;
		}
	}
	else
	{
		if (userSettings[returnedIndex][2] <= 0)
		{
			userSettings[returnedIndex][2] = 1;
			ini_write_real(userSettings[returnedIndex][0], userSettings[returnedIndex][1], 1);
		}
		else
		{
			userSettings[returnedIndex][2] = 0;
			ini_write_real(userSettings[returnedIndex][0], userSettings[returnedIndex][1], 0);
		}
	}
	
	ini_close();
}


//	Gets the index of the setting. If setting does not exist, go to error dispplay room.
function user_settings_index(settingName)
{
	for (var i = 0; i < array_length(userSettings); i++)
	{
		if (userSettings[i][1] == settingName)
		{
			return i;
		}
	}
	
	room_goto(rm_fatal_error);
	variable_instance_set(inst_250190DC, "error_code", "Setting does not exist.");
}


// Get the warning seen value.
function warning_seen_get()
{
	return flashingWarningSeen;
}


// Flip the warning seen value between 0 or 1.
function warning_seen_flip()
{
	ini_open("userSettings.ini");
	
	if (flashingWarningSeen <= 0)
	{
		flashingWarningSeen = 1;
		ini_write_real("NULL", "WarningSeen", 1);
	}
	else
	{
		flashingWarningSeen = 0;
		ini_write_real("NULL", "WarningSeen", 0);
	}
	
	ini_close();
}


//	Get the avaliable_setting_type array.
function get_avaliable_setting_type()
{
	return avaliable_setting_type;
}


//	Get an array of setting names.
function get_setting_names(settingType)
{
	var setting_names = [];
	
	for (var i = 0; i < array_length(userSettings); i++)
	{
		if (userSettings[i][0] == settingType)
		{
			setting_names += [userSettings[i][1]]
		}
	}
	
	if (array_length(setting_names) == 0)
	{
		room_goto(rm_fatal_error);
		variable_instance_set(inst_250190DC, "error_code", "Setting type does not exist.");
	}
	else
	{
		return setting_names;
	}
}