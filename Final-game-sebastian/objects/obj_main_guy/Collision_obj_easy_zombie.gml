if (place_meeting(x, y, obj_main_guy)) {
    with (obj_main_guy) {
        health -= 10;
    }
    instance_destroy(); // Enemy dies on contact
}
