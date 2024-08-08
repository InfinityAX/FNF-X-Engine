// Runs the initial setup
function game_start()
{
	// Setup the data structures
	init_data_structures();
	
	// Runs startup functions
	system_dialog.widget_set_values();	// This must always go first or else your computer will go bye bye
	debug_log.create_new_log_file();
	
	game_state.game_started = true;
}