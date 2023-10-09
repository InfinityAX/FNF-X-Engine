// Returns the string within the quotations.
/*
function scp_StringChecker_Grab(loadedString)
{
	if (!string_ends_with(loadedString, "\""))
	{
		scp_GameLoggerInsertLog("FATAL ERROR: >>>" + loadedString + "<<< does not end with \". Engine terminated.");
		game_end();
	}
	
	if (string_count("\"", loadedString) < 2)
	{
		scp_GameLoggerInsertLog("FATAL ERROR: >>>" + loadedString + "<<< is missing a \" at the beginning. Engine terminated.");
		game_end();
	}
	
	var returnString = "";
	var grabNow = false;
	
	for (var i = 0; i <= string_length(loadedString); i++)
	{
		if (grabNow == true and i < string_length(loadedString))
		{
			returnString = returnString + string_char_at(loadedString, i);
		}
		
		if (string_char_at(loadedString, i) == "\"")
		{
			grabNow = true;
		}
	}
	
	return returnString;
}*/


// Converts string to boolean.
/*function scp_StringChecker_BooleanConvert(loadedString)
{
	if (loadedString == "1" or string_lower(loadedString) == "true")
	{
		return true;
	}
	else if (loadedString == "0" or string_lower(loadedString) == "false")
	{
		return false;
	}
	else
	{
		scp_GameLoggerInsertLog("ERROR: >>>" + loadedString + "<<< is not boolean 0 (false) or 1 (true). Assuming false...");
		return false;
	}
}*/


// Converts string to colour value.
function string_parce_colour(_loaded_string)
{
	var _return_col = c_white;
	
	insert_log("Identifying colour from string...");
	
	_loaded_string = string_lower(_loaded_string);
	
	if (_loaded_string == "aqua")
	{
		_return_col = c_aqua;
	}
	else if (_loaded_string == "black")
	{
		_return_col = c_black;
	}
	else if (_loaded_string == "blue")
	{
		_return_col = c_blue;
	}
	else if (_loaded_string == "dark gray")
	{
		_return_col = c_dkgray;
	}
	else if (_loaded_string == "dark grey")
	{
		_return_col = c_dkgrey;
	}
	else if (_loaded_string == "pink")
	{
		_return_col = c_fuchsia;
	}
	else if (_loaded_string == "gray")
	{
		_return_col = c_gray;
	}
	else if (_loaded_string == "green")
	{
		_return_col = c_green;
	}
	else if (_loaded_string == "grey")
	{
		_return_col = c_grey;
	}
	else if (_loaded_string == "lime")
	{
		_return_col = c_lime;
	}
	else if (_loaded_string == "light gray")
	{
		_return_col = c_ltgray;
	}
	else if (_loaded_string == "light grey")
	{
		_return_col = c_ltgrey;
	}
	else if (_loaded_string == "maroon")
	{
		_return_col = c_maroon;
	}
	else if (_loaded_string == "navy")
	{
		_return_col = c_navy;
	}
	else if (_loaded_string == "olive")
	{
		_return_col = c_olive;
	}
	else if (_loaded_string == "orange")
	{
		_return_col = c_orange;
	}
	else if (_loaded_string == "purple")
	{
		_return_col = c_purple;
	}
	else if (_loaded_string == "red")
	{
		_return_col = c_red;
	}
	else if (_loaded_string == "silver")
	{
		_return_col = c_silver;
	}
	else if (_loaded_string == "teal")
	{
		_return_col = c_teal;
	}
	else if (_loaded_string == "yellow")
	{
		_return_col = c_yellow;
	}
	else if (_loaded_string == "white")
	{
		//return c_white;
	}
	else
	{
		insert_log(_loaded_string + " IS NOT A RECOGNIZED COLOUR. Defaulting to white...");
		//return c_white;
	}
	
	insert_log("Colour identification complete.");
	
	return _return_col;
}


// Converts string to real.
/*function scp_StringChecker_RealConvert(loadedString, isInt64, isSigned, allowNegative, upperLimit, lowerLimit)
{
	var returnNum = "";
	var hasDecimal = false;
	
	for (var i = 1; i <= string_length(loadedString); i++)
	{
		if (string_char_at(loadedString, i) != "-" and string_char_at(loadedString, i) != "." and string_char_at(loadedString, i) != "0" and string_char_at(loadedString, i) != "1" and string_char_at(loadedString, i) != "2" and string_char_at(loadedString, i) != "3" and string_char_at(loadedString, i) != "4" and string_char_at(loadedString, i) != "5" and string_char_at(loadedString, i) != "6" and string_char_at(loadedString, i) != "7" and string_char_at(loadedString, i) != "8" and string_char_at(loadedString, i) != "9")
		{
			scp_GameLoggerInsertLog("ERROR: " + string_char_at(loadedString, i) + " is not a valid character for the real function. Skipping character...");
		}
		else
		{
			if (string_char_at(loadedString, i) == "-" and i != 1)
			{
				scp_GameLoggerInsertLog("ERROR: Minus sign must be at the beginning of the number. Skipping character...");
			}
			else
			{
				if (string_char_at(loadedString, i) == "." and hasDecimal == true)
				{
					scp_GameLoggerInsertLog("ERROR: Decimal point already exist. Skipping character...");
				}
				else
				{
					returnNum = returnNum + string_char_at(loadedString, i);
				}
			}
		}
	}
	
	if (returnNum == "")
	{
		scp_GameLoggerInsertLog("ERROR: >>>" + loadedString + "<<< does not contain any numerical value. Defaulting to 0...");
		return 0;
	}
	else
	{
		returnNum = real(returnNum)
		
		if (isInt64)
		
		if (allowNegative == false)
		{
			returnNum = abs(returnNum);
		}
		
		return real(returnNum);
	}
}*/


// Converts string to unsigned int.
/*function scp_StringChecker_UnsignIntConvert(loadedString, isSigned, allowNegative)
{
	//int64(loadedString);
	scp_GameLoggerInsertLog(string(int64(loadedString)));
	var returnNum = "";
	
	for (var i = 1; i <= string_length(loadedString); i++)
	{
		if (string_char_at(loadedString, i) != "-" and string_char_at(loadedString, i) != "." and string_char_at(loadedString, i) != "0" and string_char_at(loadedString, i) != "1" and string_char_at(loadedString, i) != "2" and string_char_at(loadedString, i) != "3" and string_char_at(loadedString, i) != "4" and string_char_at(loadedString, i) != "5" and string_char_at(loadedString, i) != "6" and string_char_at(loadedString, i) != "7" and string_char_at(loadedString, i) != "8" and string_char_at(loadedString, i) != "9")
		{
			scp_GameLoggerInsertLog("ERROR: " + string_char_at(loadedString, i) + " is not a valid character for the real function. Skipping character...");
		}
		else
		{
			if (string_char_at(loadedString, i) == "-" and i != 1)
			{
				scp_GameLoggerInsertLog("ERROR: Minus sign must be at the beginning of the number. Skipping character...");
			}
			else
			{
				if (string_char_at(loadedString, i) == "." and hasDecimal == true)
				{
					scp_GameLoggerInsertLog("ERROR: Decimal point already exist. Skipping character...");
				}
				else
				{
					returnNum = returnNum + string_char_at(loadedString, i);
				}
			}
		}
	}
	
	if (returnNum == "")
	{
		scp_GameLoggerInsertLog("ERROR: >>>" + loadedString + "<<< does not contain any numerical value. Defaulting to 0...");
		return 0;
	}
	else
	{
		int
		return real(returnNum);
	}
}*/