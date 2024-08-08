globalvar game_state;
globalvar user_settings;
globalvar system_dialog;
globalvar debug_log;

// Initialises the structures
function init_data_structures()
{
	game_state = new GameStateStruct();
	user_settings = new UserConfig();
	system_dialog = new DialogStruct();
	debug_log = new DebugLogStruct();
}

// Structure to store the game's internal state
function GameStateStruct() constructor
{
	// Game states and their values
	game_started = false;
	title_seen = false;
}

// Structure to store user's prefernces
function UserConfig() constructor
{
	// Configurations and their values
	debug_logging = true;
}

// System dialog structure (depends on the DialogModule extension by Samuel Venable)
// https://dialogmodule.weebly.com/
function DialogStruct() constructor
{
	// TBH, IDK what these are
	owner = string(int64(window_handle()));
	icon = working_directory + "icon.png";
	
	// Set the values for the dialog module
	widget_set_values = function()
	{
		widget_set_owner(owner);
		widget_set_icon(icon);
	}
}

// Debug logging structure (depends on DialogStruct)
function DebugLogStruct() constructor
{
	// Do I need to explain?
	log_file_location = program_directory + "XengLOG.txt";
	log_file_created = false;
	
	// Creates a new log file (overwrites existing ones)
	create_new_log_file = function()
	{
		if (user_settings.debug_logging)
		{
			delete_log_file();
			create_log_file();
		}
	}
	
	// Creates a log file
	create_log_file = function()
	{
		if (user_settings.debug_logging)
		{
			if (log_file_created)
			{
				show_message("CODE SKIP: A debug log file has already been created. \"create_log_file\" will be skipped.");
			}
			else
			{
				log_file_created = true;
				insert_log("Log file created.");
			}
		}
	}
	
	// Deletes the log file
	delete_log_file = function()
	{
		if (user_settings.debug_logging and log_file_created)
		{
			log_file_created = false;
		
			if(!file_delete(log_file_location))
			{
				show_message("CODE SKIP: The debug log file appears to have been deleted, renamed, or moved. \"delete_log_file\" will be skipped.");
			}
		}
	}
	
	// Appends a log to the file
	insert_log = function(_ltext)
	{
		if (user_settings.debug_logging)
		{
			if (!is_string(_ltext) or !log_file_created)
			{
				show_message("CODE SKIP: It appears that either the debug log file has not been created, or the debug message is not formatted correctly. \"insert_log\" will be skipped.");
			}
			else
			{
				var _ofile = file_text_open_append(log_file_location);
				var _datetimestr = date_datetime_string(date_current_datetime());
		
				file_text_write_string(_ofile, _datetimestr + " - " + _ltext);
				file_text_writeln(_ofile);
				file_text_close(_ofile);
			}
		}
	}
}