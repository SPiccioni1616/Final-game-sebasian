// Set font and color
draw_set_font(fnt_default);
draw_set_color(c_white);

// Display health
draw_text(10, 10, "Health: " + string(obj_main_guy.health));