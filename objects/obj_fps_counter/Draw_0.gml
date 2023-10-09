draw_set_font(default_system_font[0]);
draw_set_color(default_system_font[3]);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_transformed(2, 2, "FPS: " + string(fps), (0.5*default_system_font[1]), (0.5*default_system_font[2]), 0);
draw_text_transformed(2, 17, "FPS Real: " + string(fps_real), (0.5*default_system_font[1]), (0.5*default_system_font[2]), 0);