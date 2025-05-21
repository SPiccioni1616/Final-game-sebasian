// Enemy speed
var spd = 2; // adjust as needed

// Damage cooldown timer (decrease every step)
if (damage_cooldown > 0) {
    damage_cooldown -= 1;
}

// Find player instance
if (instance_exists(obj_main_guy)) {
    var target = obj_main_guy;

    // Calculate direction toward player
    var dir = point_direction(x, y, target.x, target.y);

    // Calculate movement vector
    var move_x = lengthdir_x(spd, dir);
    var move_y = lengthdir_y(spd, dir);

    // Horizontal collision check & movement
    if (!place_meeting(x + move_x, y, obj_ground)) {
        x += move_x;
    }

    // Vertical collision check & movement
    if (!place_meeting(x, y + move_y, obj_ground)) {
        y += move_y;
    }

    // Check distance to player for damage
    var dist = point_distance(x, y, target.x, target.y);
    if (dist < 20 && damage_cooldown <= 0) {
        if (variable_instance_exists(target, "health")) {
            target.health -= 10;  // Damage amount
            damage_cooldown = damage_delay;  // Reset cooldown
        }
    }
}


