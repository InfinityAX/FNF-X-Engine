globalvar game_started;
globalvar title_seen;


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


// Initalize the title seen state
function title_seen_i()
{
	title_seen = 0;
	
	insert_log("Title state check created/reset...");
	
	return;
}


// Toggles the title state
function title_seen_t()
{
	if (title_seen == 1)
	{
		game_start_i();
	}
	else
	{
		title_seen = 1;
		insert_log("Title state seen by the user.");
	}
	
	return;
}