draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var center_x = display_get_gui_width() / 2;
var center_y = display_get_gui_height() / 2;

for (var i = 0; i < array_length(menu_options); i++) {
    if (i == selected) {
        draw_set_color(c_yellow);
    } else {
        draw_set_color(c_white);
    }
    draw_text(center_x, center_y + i * 40, menu_options[i]);
}
