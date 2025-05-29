

if (mouse_check_button_pressed(mb_left)) {
    if (point_in_rectangle(mouse_x, mouse_y, x, y, x + sprite_width, y + sprite_height)) {
        room_goto(rm_menu);// Replace rm_main_game with your main game room name
    }
}








