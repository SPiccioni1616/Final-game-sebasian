var text = "Wave: " + string(wave_number);
var text_width = string_width(text);
var x_pos = (display_get_gui_width() / 2) - (text_width / 2);
var y_pos = 20;

draw_set_color(c_white);
draw_set_font(fnt_powerup);
draw_text(x_pos, y_pos, text);
