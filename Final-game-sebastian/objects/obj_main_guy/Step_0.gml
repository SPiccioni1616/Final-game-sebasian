
// Handle horizontal input
move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
move_x *= move_speed;

// Jump input
var jump_pressed = keyboard_check_pressed(vk_up);

// Ground check
is_grounded = place_meeting(x, y + 2, obj_ground);

// Gravity and jumping
if (is_grounded && jump_pressed) {
    move_y = jump_speed;
} else if (move_y < max_fall_speed) {
    move_y += gravity_force;
}

// Move the player and collide with ground
move_and_collide(move_x, move_y, obj_ground);

// Restart room if out of bounds
if (y < -300 || y > room_height + 300) {
    room_restart();
}

// Health check
if (health <= 0) {
    room_restart();
}
