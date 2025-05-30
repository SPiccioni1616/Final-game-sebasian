global.points += 1;

// Check if it's time to offer a power-up
if (global.points >= global.next_powerup_score) {
    global.show_powerup_choice = true;
    global.next_powerup_score += 25;
}

// Destroy both the bullet and the zombie
with (other) {
    instance_destroy();
}

instance_destroy();

