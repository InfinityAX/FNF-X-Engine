modName = "";

function load_splash_text()
{
	
}

function load_mod_name()
{
	var readingFile = file_text_open_read("modNAME.txt");
	modName = file_text_read_string(readingFile);
	file_text_close(readingFile);
	
	var numberOfThatSymbol = 0;
	
	for (var i = 0; i < string_length(modName); i++)
	{
		if (string_char_at(modName, i) == "'")
		{
			numberOfThatSymbol++;
		}
	}
	
	if (numberOfThatSymbol != 2)
	{
		set_error_message("Wrong formatting in file.");
		room_goto(rm_fatal_error);
	}
}