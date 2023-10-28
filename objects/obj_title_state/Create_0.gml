room_goto(rm_flashing_state);

/*if (!variable_global_exists("game_started"))
{
	create_log_file();
	game_start_i();
	auto_window_control();
	load_options();
	//load_default_font_file();
	
	if(fps_counter_d != 0)
	{
		instance_create_depth(0, 0, 0, obj_fps_counter);
	}

	if (flashing_lights == -1)
	{
		insert_log("Going to rm_flashing_state...");
		room_goto(rm_flashing_state);
	}
}


if (game_started == 0)
{	
	game_start_t();
	auto_window_control();
	load_options();
	//load_default_font_file();
	
	if(fps_counter_d != 0)
	{
		instance_create_depth(0, 0, 0, obj_fps_counter);
	}
	
	if (flashing_lights == -1)
	{
		insert_log("Going to rm_flashing_state...");
		room_goto(rm_flashing_state);
	}
}


insert_log("Loading rm_title_state...");

if (!variable_global_exists("title_seen"))
{
	game_set_speed((100/60), gamespeed_fps);
	title_seen_i();
}

insert_log("rm_title_state loaded.");*/