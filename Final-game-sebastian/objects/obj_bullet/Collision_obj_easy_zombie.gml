
// Add 1 point to the score
global.points += 1;

// Check if it's time to show a power-up menu
if (global.points >= global.next_powerup_score) {
    global.show_powerup_choice = true;            // Tells the power-up menu to show
    global.next_powerup_score += 25;              // Set the next threshold (e.g., 25, 50, 75...)
}

// Destroy both instances (zombie and bullet)
with (other) {
    instance_destroy(); // destroy the zombie
}
instance_destroy();     // destroy the bullet
