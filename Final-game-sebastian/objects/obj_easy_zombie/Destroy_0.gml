with (obj_wave_manager) {
   enemies_left -= 1;
    if (enemies_left <= 0) {
      alarm[0] = spawn_timer; // Start timer for next wave
    }
}
