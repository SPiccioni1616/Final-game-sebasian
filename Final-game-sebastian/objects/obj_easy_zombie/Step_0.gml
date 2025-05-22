
// Damage cooldown timer
if (damage_cooldown > 0) {
    damage_cooldown -= 1;
}

// Movement toward player
if (instance_exists(obj_main_guy)) {
    var target = obj_main_guy;
    var dir = point_direction(x, y, target.x, target.y);
    hsp += lengthdir_x(spd, dir);
    vsp += lengthdir_y(spd, dir);
}

// Bounce off other zombies
var self_inst = id;

with (obj_easy_zombie) {
    if (id != self_inst) {
        if (place_meeting(x, y, self_inst)) {
            var dx = x - self_inst.x;
            var dy = y - self_inst.y;
            var dist = point_distance(x, y, self_inst.x, self_inst.y);

            if (dist != 0) {
                var push_x = (dx / dist) * bounce_force;
                var push_y = (dy / dist) * bounce_force;

                hsp += push_x;
                vsp += push_y;
            } else {
                var angle = random(360);
                hsp += lengthdir_x(bounce_force, angle);
                vsp += lengthdir_y(bounce_force, angle);
            }
        }
    }
}

// Clamp speed and apply friction
hsp = clamp(hsp, -max_speed, max_speed);
vsp = clamp(vsp, -max_speed, max_speed);

hsp *= my_friction;
vsp *= my_friction;

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

// Damage player if close + knockback
if (instance_exists(obj_main_guy)) {
    if (point_distance(x, y, obj_main_guy.x, obj_main_guy.y) < 20 && damage_cooldown <= 0) {
        if (variable_instance_exists(obj_main_guy, "health")) {
            obj_main_guy.health -= 10;
            damage_cooldown = damage_delay;

            // Apply knockback to player
            var knock_dir = point_direction(x, y, obj_main_guy.x, obj_main_guy.y);
            var knock_force = 5; // tweak this

            obj_main_guy.knockback_x += lengthdir_x(knock_force, knock_dir);
            obj_main_guy.knockback_y += lengthdir_y(knock_force, knock_dir);
        }
    }
}

