// obj_restart_controller -> Mouse Left Pressed Event
if (mouse_x >= global.restart_btn_x && mouse_x <= global.restart_btn_x + global.restart_btn_w &&
    mouse_y >= global.restart_btn_y && mouse_y <= global.restart_btn_y + global.restart_btn_h) {
    
    // Restart the game (or go to the first room)
    room_goto(room_start); // You can change to a specific room if needed
}
