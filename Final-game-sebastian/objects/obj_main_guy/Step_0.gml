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

// Apply knockback
x += knockback_x;
y += knockback_y;

// Gradually reduce knockback
knockback_x *= 0.8;
knockback_y *= 0.8;

// Restart room if out of bounds
if (y < -300 || y > room_height + 300) {
    room_restart();
}

// Health check
if (health <= 0) {
    instance_destroy(); // Remove player
 //  show_message("Game Over");
 //  game_restart(); // Restart the game
   room_goto(rm_gameover)
}
//shooting
if (mouse_check_button_pressed(mb_left)) {
    if (global.multi_shot) {
        var angle = point_direction(x, y, mouse_x, mouse_y);

        var b1 = instance_create_layer(x, y, "Instances_1", obj_bullet);
        b1.direction = angle - 10;

        var b2 = instance_create_layer(x, y, "Instances_1", obj_bullet);
        b2.direction = angle;

        var b3 = instance_create_layer(x, y, "Instances_1", obj_bullet);
        b3.direction = angle + 10;
    } else {
        var b = instance_create_layer(x, y, "Instances_1", obj_bullet);
        b.direction = point_direction(x, y, mouse_x, mouse_y);
    }
}
// Update invincibility timer
if (invincibility_timer > 0) {
    invincibility_timer -= 1;
}

// Check for zombie collision and apply damage
if (invincibility_timer <= 0) {
    var zombie = instance_place(x, y, obj_easy_zombie);
    if (zombie != noone) {
        health -= 10;
        invincibility_timer = 30; // 0.5 seconds of invincibility

        // Knockback
        var dx = x - zombie.x;
        var dy = y - zombie.y;
        var dist = point_distance(x, y, zombie.x, zombie.y);
        if (dist != 0) {
            knockback_x = dx / dist * 5;
            knockback_y = dy / dist * 5;
        }
    }
}















