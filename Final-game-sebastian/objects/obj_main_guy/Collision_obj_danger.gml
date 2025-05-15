// Reduce health when colliding with a spike

health -= 5;  // Decrease health by 10 points (adjust as necessary)


if (health <= 0) {
    room_restart();  // Restart the room when the player dies
	health = 100;
}
