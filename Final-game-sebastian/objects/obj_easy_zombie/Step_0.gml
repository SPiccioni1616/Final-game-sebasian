// Gravity
vsp += grav;

// Follow the player
if (instance_exists(obj_main_guy)) {
    if (x < obj_main_guy.x) {
        hsp = spd; // move right
    } else if (x > obj_main_guy.x) {
        hsp = -spd; // move left
    } else {
        hsp = 0;
    }
}

// Horizontal collision
if (place_meeting(x + hsp, y, obj_ground)) {
    while (!place_meeting(x + sign(hsp), y, obj_ground)) {
        x += sign(hsp);
    }
    hsp = 0;
}
x += hsp;

// Vertical collision
if (place_meeting(x, y + vsp, obj_ground)) {
    while (!place_meeting(x, y + sign(vsp), obj_ground)) {
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;






if (instance_exists(obj_main_guy) && damage_cooldown <= 0) {
    var dist = point_distance(x, y, obj_main_guy.x, obj_main_guy.y);

    if (dist < 20) { // Change 20 to how close it needs to be
      
	  var player = instance_place(x, y, obj_main_guy);
if (player != noone && variable_instance_exists(player, "health")) {
    player.health -= 10;
    damage_cooldown = damage_delay;
}
    }
}
