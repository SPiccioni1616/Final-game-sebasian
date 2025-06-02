if (visible) {
    // Set font (make sure you've created this in the Asset Browser!)
       draw_set_font(fnt_powerup); // Create a font named 'fnt_powerup' with size ~48

    // Set color to red
    draw_set_color(c_black);

    // Center text alignment
    draw_set_halign(fa_center);

    // Draw text
    draw_text(room_width / 2, 100, " Choose a Power-Up!");
    draw_text(room_width / 2, 160, "1 - Instant Heal");
    draw_text(room_width / 2, 200, "2 - Speed Boost");
    draw_text(room_width / 2, 240, "3 - Multi-Shot");
}
