function spawn_wave(w) {
    var enemy_count = w * 3; // Increase enemy count each wave
    for (var i = 0; i < enemy_count; i++) {
        instance_create_layer(random(room_width), random(room_height), "Instances", obj_enemy);
        enemies_left += 1;
    }
}
