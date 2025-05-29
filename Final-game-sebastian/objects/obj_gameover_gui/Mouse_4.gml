// Check if the mouse is inside the button
var btn_x = room_width / 2 - 100;
var btn_y = room_height / 2;
var btn_w = 200;
var btn_h = 50;

if (mouse_x > btn_x && mouse_x < btn_x + btn_w && mouse_y > btn_y && mouse_y < btn_y + btn_h) {
    room_goto(rm_menu); // Replace with your actual main menu room
}
