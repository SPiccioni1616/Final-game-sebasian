if (teleport_pending) {
    x = teleport_target_x;
    y = teleport_target_y;
    teleport_pending = false;
    show_debug_message("Teleported (End Step)");
}

