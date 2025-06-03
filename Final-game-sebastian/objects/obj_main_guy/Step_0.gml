// Cancel any built-in movement left over from earlier speed boosts
speed = 0;

// Handle input for top-down movement
var move_h = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var move_v = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// Normalize diagonal movement
var move_length = point_distance(0, 0, move_h, move_v);
if (move_length > 0) {
    move_h /= move_length;
    move_v /= move_length;
}

// Movement vector
var move_x = move_h * move_speed;
var move_y = move_v * move_speed;

// Move the player and collide with ground/walls
move_and_collide(move_x, move_y, obj_ground); // or obj_wall

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
    instance_destroy();
    room_goto(rm_gameover);
}

// Shooting
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

// Invincibility timer
if (invincibility_timer > 0) {
    invincibility_timer -= 1;
}

// Zombie collision check with bounding box
if (invincibility_timer <= 0) {
    var zombie = collision_rectangle(
        bbox_left, bbox_top,
        bbox_right, bbox_bottom,
        obj_easy_zombie, false, true
    );
    
    if (zombie != noone) {
        health -= 10;
        show_debug_message("Player health now: " + string(health));
        invincibility_timer = 30;

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
