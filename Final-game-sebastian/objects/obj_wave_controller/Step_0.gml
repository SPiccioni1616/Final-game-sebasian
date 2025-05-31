if (wave_in_progress) {
    // Spawn enemies over time
    if (enemies_spawned < enemies_per_wave) {
        enemy_spawn_timer--;

        if (enemy_spawn_timer <= 0) {
            // Spawn at a random spawn point if any exist
            if (instance_number(obj_spawn_point) > 0) {
                var index = irandom(instance_number(obj_spawn_point) - 1);
                var spawner = instance_find(obj_spawn_point, index);
                instance_create_layer(spawner.x, spawner.y, "Instances_1", obj_easy_zombie);
                
                enemies_spawned++;
                enemies_alive++;
                enemy_spawn_timer = spawn_delay;
            }
        }
    }

    // If all enemies are dead and all were spawned
    if (enemies_spawned >= enemies_per_wave && enemies_alive <= 0) {
        wave_in_progress = false;
        alarm[0] = 60; // wait 1 seconds before starting next wave
    }
}
