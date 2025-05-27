if (teleport_cooldown <= 0) { 
    x = 560;
    y = 1054;
    teleport_cooldown = 30;
    show_debug_message("Manually teleported to 560,1054");
}

show_debug_message("Collision triggered.");
show_debug_message("Cooldown: " + string(teleport_cooldown));
