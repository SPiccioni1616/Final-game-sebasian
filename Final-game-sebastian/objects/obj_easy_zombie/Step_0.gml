// Initialize movement variables if not already
if (!variable_global_exists("hsp")) hsp = 0;
if (!variable_global_exists("vsp")) vsp = 0;

// Damage cooldown
if (damage_cooldown > 0) damage_cooldown--;

// Movement toward player
var move_x = 0;
var move_y = 0;

if (instance_exists(obj_main_guy)) {
    var dir_to_player = point_direction(x, y, obj_main_guy.x, obj_main_guy.y);
    move_x = lengthdir_x(spd, dir_to_player);
    move_y = lengthdir_y(spd, dir_to_player);
}

// Repel from other zombies
var self_inst = id;
var repel_x = 0;
var repel_y = 0;

with (obj_easy_zombie) {
    if (id != self_inst) {
        var dx = other.x - x;
        var dy = other.y - y;
        var dist = point_distance(other.x, other.y, x, y);

        if (dist > 0 && dist < 32) {
            var push_strength = (32 - dist) / 32 * 2; // Increase if needed
            repel_x -= (dx / dist) * push_strength;
            repel_y -= (dy / dist) * push_strength;
        }
    }
}

// Combine movement and repulsion
hsp += move_x + repel_x;
vsp += move_y + repel_y;

// Clamp speed and apply friction
var max_speed = 3;
hsp = clamp(hsp, -max_speed, max_speed);
vsp = clamp(vsp, -max_speed, max_speed);

hsp *= 0.9;
vsp *= 0.9;

// Move with collision
if (!place_meeting(x + hsp, y, obj_ground)) {
    x += hsp;
} else {
    hsp = -hsp * 0.5;
}

if (!place_meeting(x, y + vsp, obj_ground)) {
    y += vsp;
} else {
    vsp = -vsp * 0.5;
}

// Damage player if close
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
