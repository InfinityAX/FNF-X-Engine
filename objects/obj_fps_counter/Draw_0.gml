draw_set_font(default_system_font);
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_transformed(0, 0, "FPS: " + string(fps), 0.5, 0.5, 0);
draw_text_transformed(0, 15, "FPS Real: " + string(fps_real), 0.5, 0.5, 0);