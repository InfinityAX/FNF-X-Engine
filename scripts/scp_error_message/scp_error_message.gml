global.errorMessage = "";


// Set the error message.
function set_error_message(code)
{
	global.errorMessage = code;
}


// Get the error message.
function get_error_message()
{
	return global.errorMessage;
}