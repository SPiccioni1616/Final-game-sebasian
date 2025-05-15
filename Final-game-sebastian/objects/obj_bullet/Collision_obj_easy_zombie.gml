// Reduce health
health -= 25;

// Check if health is depleted
if (health <= 0) {
    // Destroy the zombie
    instance_destroy();
}