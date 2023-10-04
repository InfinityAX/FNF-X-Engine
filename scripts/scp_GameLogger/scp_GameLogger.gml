// Creates a new log file.
function scp_GameLoggerCreate()
{
	if (file_exists("XengLOG.txt"))
	{
		file_delete("XengLOG.txt");
	}
	
	var openFile = file_text_open_write("XengLOG.txt");
	var dateTimeStr = date_datetime_string(date_current_datetime());
	file_text_write_string(openFile, dateTimeStr + " - Log file created successfully.");
	file_text_writeln(openFile);
	file_text_close(openFile);
}

// Insert log into file.
function scp_GameLoggerInsertLog(logText)
{
	var openFile = file_text_open_append("XengLOG.txt");
	var dateTimeStr = date_datetime_string(date_current_datetime());
	file_text_write_string(openFile, dateTimeStr + " - " + logText);
	file_text_writeln(openFile);
	file_text_close(openFile);
}