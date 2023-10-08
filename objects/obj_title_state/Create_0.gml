if (!variable_global_exists("game_started"))
{
	globalvar game_started;
	
	create_log_file();
	
	insert_log("GAME START");
	
	auto_window_control();
	load_options();
	load_default_fonts();
	
	if(fps_counter_d != 0)
	{
		instance_create_depth(0, 0, 0, obj_fps_counter);
	}
}

insert_log("Loading rm_title_state...");

if (flashing_lights == -1)
{
	insert_log("Going to rm_flashing_state...");
	room_goto(rm_flashing_state);
}

insert_log("rm_title_state loaded.");