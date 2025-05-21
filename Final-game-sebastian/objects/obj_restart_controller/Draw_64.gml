// obj_restart_controller -> Draw GUI Event
var btn_width = 100;
var btn_height = 40;
var btn_x = display_get_gui_width() - btn_width - 20;
var btn_y = 20;

// Draw the button
draw_set_color(c_red);
draw_rectangle(btn_x, btn_y, btn_x + btn_width, btn_y + btn_height, false);
draw_set_color(c_white);
draw_text(btn_x + 10, btn_y + 10, "Restart");

// Save the coordinates for use in the Mouse Event
global.restart_btn_x = btn_x;
global.restart_btn_y = btn_y;
global.restart_btn_w = btn_width;
global.restart_btn_h = btn_height;


