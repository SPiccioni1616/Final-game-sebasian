// Reduce health when colliding with a spike

health -= 0.5;


if (health <= 0) {
    room_goto(rm_gameover)
	health = 100;
}
