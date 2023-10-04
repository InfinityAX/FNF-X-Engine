// Creates a new log file.
function create_log_file()
{
	if (file_exists("XengLOG.txt"))
	{
		file_delete("XengLOG.txt");
	}
	
	var _ofile = file_text_open_write("XengLOG.txt");
	var _datetimestr = date_datetime_string(date_current_datetime());
	
	file_text_write_string(_ofile, _datetimestr + " - Log file created successfully.");
	file_text_writeln(_ofile);
	file_text_close(_ofile);
	
	return;
}

// Insert log into file.
function insert_log(_ltext)
{
	var _ofile = file_text_open_append("XengLOG.txt");
	var _datetimestr = date_datetime_string(date_current_datetime());
	
	file_text_write_string(_ofile, _datetimestr + " - " + _ltext);
	file_text_writeln(_ofile);
	file_text_close(_ofile);
}