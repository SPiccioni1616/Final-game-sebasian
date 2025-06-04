draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_blue);
draw_set_font(-1); // Default font; change if using a custom one

draw_text(20, 20, " Cancer Cells Destroyed: " + string(global.points));
