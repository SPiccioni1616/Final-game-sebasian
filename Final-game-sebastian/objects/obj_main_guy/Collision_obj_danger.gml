// Reduce health when colliding with a spike

health -= 5;


if (health <= 0) {
    room_restart();  // Restart the room when the player dies
	health = 100;
}
