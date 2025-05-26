// === Damage cooldown ===
if (damage_cooldown > 0) damage_cooldown--;

// === Movement toward player ===
var move_x = 0;
var move_y = 0;

if (instance_exists(obj_main_guy)) {
    var dir_to_player = point_direction(x, y, obj_main_guy.x, obj_main_guy.y);
    move_x = lengthdir_x(spd, dir_to_player);
    move_y = lengthdir_y(spd, dir_to_player);
}

// === Move toward player ===
x += move_x;
y += move_y;

// === Separation from other zombies (only THIS zombie gets pushed) ===
var near_zombie = instance_place(x, y, obj_easy_zombie);
if (near_zombie != noone && near_zombie.id != id) {
    var dist = point_distance(x, y, near_zombie.x, near_zombie.y);
    if (dist < 28 && dist > 0) {
        var angle = point_direction(near_zombie.x, near_zombie.y, x, y); // push away from near_zombie
        var push_amount = (28 - dist) * 0.5;
        x += lengthdir_x(push_amount, angle);
        y += lengthdir_y(push_amount, angle);
    }
}

// === Wall collision (if needed) ===
if (place_meeting(x, y, obj_ground)) {
    var resolve_dir = point_direction(x, y, obj_main_guy.x, obj_main_guy.y) + 180;
    x += lengthdir_x(2, resolve_dir);
    y += lengthdir_y(2, resolve_dir);
}

// === Damage player if close ===
if (instance_exists(obj_main_guy)) {
    if (point_distance(x, y, obj_main_guy.x, obj_main_guy.y) < 20 && damage_cooldown <= 0) {
        if (variable_instance_exists(obj_main_guy, "health")) {
            obj_main_guy.health -= 10;
            damage_cooldown = damage_delay;

            // Knockback
            var knock_dir = point_direction(x, y, obj_main_guy.x, obj_main_guy.y);
            obj_main_guy.knockback_x += lengthdir_x(5, knock_dir);
            obj_main_guy.knockback_y += lengthdir_y(5, knock_dir);
        }
    }
}


// === Prevent zombie from overlapping the player ===
if (instance_exists(obj_main_guy)) {
    var dist_to_player = point_distance(x, y, obj_main_guy.x, obj_main_guy.y);
    if (dist_to_player < 12 && dist_to_player > 0) {
        var push_dir = point_direction(obj_main_guy.x, obj_main_guy.y, x, y);
        var push_amt = (24 - dist_to_player) * 0.5; // adjust radius if needed
        x += lengthdir_x(push_amt, push_dir);
        y += lengthdir_y(push_amt, push_dir);
    }
}
