var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

var btn_x = 50;
var btn_y = 50;
var btn_w = sprite_get_width(spr_restart_controller);
var btn_h = sprite_get_height(spr_restart_controller);

if (mx > btn_x && mx < btn_x + btn_w && my > btn_y && my < btn_y + btn_h) {
    room_goto(rm_menu); // Change to your menu room name
}


var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

var btn_x = 50;
var btn_y = 50;
var hover = (mx > btn_x && mx < btn_x + sprite_get_width(spr_restart_controller_2) &&
             my > btn_y && my < btn_y + sprite_get_height(spr_restart_controller_2));

draw_sprite(spr_restart_controller_2, hover ? 1 : 0, btn_x, btn_y);

show_debug_message("Mouse clicked");
