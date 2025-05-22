// Handle input for top-down movement
var move_h = keyboard_check(vk_right) - keyboard_check(vk_left);
var move_v = keyboard_check(vk_down) - keyboard_check(vk_up);

// Normalize diagonal movement
var move_length = point_distance(0, 0, move_h, move_v);
if (move_length > 0) {
    move_h /= move_length;
    move_v /= move_length;
}

// Set movement vector
move_x = move_h * move_speed;
move_y = move_v * move_speed;

// Move the player and collide with ground/walls
move_and_collide(move_x, move_y, obj_ground); // or obj_wall if that’s what you use

// Restart room if out of bounds
if (y < -300 || y > room_height + 300) {
    room_restart();
}

// Health check
if (health <= 0) {
    room_restart();
}





// Combine movement input and knockback
var final_move_x = move_x + knockback_x;
var final_move_y = move_y + knockback_y;

// Move the player
x += final_move_x;
y += final_move_y;

// Slowly reduce knockback over time
knockback_x *= 0.85;
knockback_y *= 0.85;
