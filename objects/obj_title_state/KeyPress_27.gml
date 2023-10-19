if (title_seen != 0)
{
	insert_log("Key escape press detected.");
	insert_log("GAME END");

	game_end();
}