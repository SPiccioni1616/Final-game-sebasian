// Step Event for obj_effect

// Safety check: if no target, destroy self
if (!variable_instance_exists(id, "target")) {
    show_debug_message(" obj_effect missing target, destroying self.");
    instance_destroy();
    exit;
}

// Smoothly move towards target position (offset 32 pixels up)
x += (target.x - x) * 0.2;
y += ((target.y - 32) - y) * 0.2;

// If close enough to target, teleport player and destroy self
if (distance_to_point(target.x, target.y - 32) < 10) {
    with (main_guy) {
        x = target.x;
        y = target.y - 32;
    }
    instance_destroy();
}
