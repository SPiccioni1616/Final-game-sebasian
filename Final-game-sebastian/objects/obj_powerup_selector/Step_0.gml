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
            // Initialize counter if it doesn't exist
            if (!variable_global_exists("speed_boost_count")) {
                global.speed_boost_count = 0;
            }

            // Apply speed boost only if less than 3 times
            if (global.speed_boost_count < 3) {
                move_speed += 1.5;
                global.speed_boost_count += 1;
            }
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
