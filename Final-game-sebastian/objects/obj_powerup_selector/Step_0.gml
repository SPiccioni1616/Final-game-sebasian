if (global.show_powerup_choice) {
    visible = true;

    if (keyboard_check_pressed(ord("1"))) {
        with (obj_main_guy) {
            health = min(health + 100, max_health + 50);
        }
        close_powerup();
    }

    if (keyboard_check_pressed(ord("2"))) {
        with (obj_main_guy) {
            move_speed += 1.5;;
        }
        close_powerup();
    }

    if (keyboard_check_pressed(ord("3"))) {
        global.multi_shot = true;
        alarm[0] = room_speed * 10;
        close_powerup();
    }
}

function close_powerup() {
    visible = false;
    global.show_powerup_choice = false;
}
