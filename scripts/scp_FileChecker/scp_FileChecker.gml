// Counts the number of lines in a text file.
function scp_FileChecker_LineCount(fileIndex)
{
	var linesCounted = 0;
	
	while (!file_text_eof(fileIndex))
	{
		linesCounted += 1;
		file_text_readln(fileIndex);
	}
	
	return linesCounted;
}

/*function ErrorCheckerCanConvertToReal(inputString)
{
	var periodsCounted = 0;
	var dashCounted = 0;
	
	for (var i = 1; )
}*/