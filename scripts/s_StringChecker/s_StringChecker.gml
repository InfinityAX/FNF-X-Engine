// Returns the string within the quotations.
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
}


// Converts string to boolean.
function scp_StringChecker_BooleanConvert(loadedString)
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
}


// Converts string to colour value.
function scp_StringChecker_ColourConvert(loadedString)
{
	if (string_lower(loadedString) == "aqua")
	{
		return c_aqua;
	}
	else if (string_lower(loadedString) == "black")
	{
		return c_black;
	}
	else if (string_lower(loadedString) == "blue")
	{
		return c_blue;
	}
	else if (string_lower(loadedString) == "dark gray")
	{
		return c_dkgray;
	}
	else if (string_lower(loadedString) == "dark grey")
	{
		return c_dkgrey;
	}
	else if (string_lower(loadedString) == "pink")
	{
		return c_fuchsia;
	}
	else if (string_lower(loadedString) == "gray")
	{
		return c_gray;
	}
	else if (string_lower(loadedString) == "green")
	{
		return c_green;
	}
	else if (string_lower(loadedString) == "grey")
	{
		return c_grey;
	}
	else if (string_lower(loadedString) == "lime")
	{
		return c_lime;
	}
	else if (string_lower(loadedString) == "light gray")
	{
		return c_ltgray;
	}
	else if (string_lower(loadedString) == "light grey")
	{
		return c_ltgrey;
	}
	else if (string_lower(loadedString) == "maroon")
	{
		return c_maroon;
	}
	else if (string_lower(loadedString) == "navy")
	{
		return c_navy;
	}
	else if (string_lower(loadedString) == "olive")
	{
		return c_olive;
	}
	else if (string_lower(loadedString) == "orange")
	{
		return c_orange;
	}
	else if (string_lower(loadedString) == "purple")
	{
		return c_purple;
	}
	else if (string_lower(loadedString) == "red")
	{
		return c_red;
	}
	else if (string_lower(loadedString) == "silver")
	{
		return c_silver;
	}
	else if (string_lower(loadedString) == "teal")
	{
		return c_teal;
	}
	else if (string_lower(loadedString) == "yellow")
	{
		return c_yellow;
	}
	else if (string_lower(loadedString) == "white")
	{
		return c_white;
	}
	else
	{
		scp_GameLoggerInsertLog("ERROR: >>>" + loadedString + "<<< is not regonised colour. Regonised colours are:\naqua, black, blue, dark gray, dark grey, gray, green, grey, light gray, light grey, lime, maroon, navy, olive, orange, pink, purple, red, silver, teal, white, yellow\nAssuming white...");
		return c_white;
	}
}


// Converts string to real.
function scp_StringChecker_RealConvert(loadedString, isInt64, isSigned, allowNegative, upperLimit, lowerLimit)
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
}


// Converts string to unsigned int.
function scp_StringChecker_UnsignIntConvert(loadedString, isSigned, allowNegative)
{
	//int64(loadedString);
	scp_GameLoggerInsertLog(string(int64(loadedString)));
	/**var returnNum = "";
	
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
	}**/
}