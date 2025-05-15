// Apply gravity
vsp += gravity;

// Vertical collision
if (place_meeting(x, y + vsp, obj_ground)) {
    while (!place_meeting(x, y + sign(vsp), obj_ground)) {
        y += sign(vsp);
    }
    vsp = 0;
} else {
    y += vsp;
}

// Horizontal movement towards the player
if (instance_exists(obj_main_guy)) {
    if (x < obj_main_guy.x) {
        x += move_speed;
    } else if (x > obj_main_guy.x) {
        x -= move_speed;
    }
}

