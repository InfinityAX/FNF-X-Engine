globalvar game_started;


// Initalize the game start state
function game_start_i()
{
	game_started = 1;
	
	insert_log("GAME START");
	
	return;
}


// Toggles the game start state
function game_start_t()
{
	if (game_started == 0)
	{
		game_start_i();
	}
	else
	{
		game_started = 0;
		insert_log("GAME END/RESET");
	}
	
	return;
}