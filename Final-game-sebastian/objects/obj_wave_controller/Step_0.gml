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
        alarm[0] = 60; // wait 1 second before starting next wave
    }
}


if (wave_number == 6 && !wave6_song_played) {
    audio_play_sound(_1738_song, 1, false);
    wave6_song_played = true;
}

if (wave_number == 10 && !wave10_song_played) {
    audio_play_sound(victory_mario_series_hq_super_smash_bros, 1, false);
    wave10_song_played = true;

    // Go to the "You Win" room
    room_goto(room_you_win);
}