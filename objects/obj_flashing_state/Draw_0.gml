draw_set_font(default_system_font[0]);
draw_set_color(default_system_font[3]);
draw_set_alpha(dalpha);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_ext_transformed(640, 380, "Hey, watch out!\nThis Mod contains some flashing lights!\nPress ENTER to disable them now or go to Options Menu.\nPress ESCAPE to ignore this message.\nYou've been warned!", 80, 1280, (1*default_system_font[1]), (1*default_system_font[2]), 0);