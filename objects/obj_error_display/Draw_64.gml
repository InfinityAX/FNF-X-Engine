room_set_height(room, 200);
room_set_width(room, 420);
draw_set_font(ft_default);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text_transformed_color(room_width/2, room_height/2, error_code, 1, 1, 0, c_black, c_black, c_black, c_black, 1);
draw_text_transformed_color(room_width/2, (room_height/2)+20, "Press enter to terminate the game.", 1, 1, 0, c_black, c_black, c_black, c_black, 1);