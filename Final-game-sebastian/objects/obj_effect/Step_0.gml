part_particles_create(test, particle1, x, y, 1);

x += (target.x - x) * 0.2;
y += ((target.y - 32) - y) * 0.2;

if (distance_to_point(target.x, target.y - 32) < 10) {
    instance_destroy();
    main_guy.x = target.x;
    main_guy.y = target.y - 32;
}

