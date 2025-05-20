health += 20; // heal player itself

if (health > max_health) {
    health = max_health;
}

with (obj_cure) {
    instance_destroy();
}