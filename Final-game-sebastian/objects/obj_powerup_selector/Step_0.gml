if (visible) {
    if (keyboard_check_pressed(ord("1"))) {
        // Heal
        with (obj_main_guy) {
            hp = min(hp + 25, max_hp);
        }
        close_powerup();
    }

    if (keyboard_check_pressed(ord("2"))) {
        // Speed boost
        with (obj_main_guy) {
            speed += 1.5;
        }
        close_powerup();
    }

    if (keyboard_check_pressed(ord("3"))) {
        // Multi-shot
        global.multi_shot = true;
        alarm[0] = room_speed * 10; // 10 seconds
        close_powerup();
    }
}
