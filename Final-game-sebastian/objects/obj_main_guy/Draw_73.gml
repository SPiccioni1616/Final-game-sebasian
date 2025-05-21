//draw_set_color(c_black)
//draw_text(x -50, y -50, "cures: " + string(cure));

// Draw the player sprite
draw_self();

// Health bar position
var bar_width = 40;
var bar_height = 6;
var x_offset = -bar_width / 2;
var y_offset = -sprite_height - 1;

// Draw background (gray)
draw_set_color(c_gray);
draw_rectangle(x + x_offset, y + y_offset, x + x_offset + bar_width, y + y_offset + bar_height, false);

// Draw health portion (solid red)
var health_percent = health / max_health;
var health_bar_width = bar_width * health_percent;

draw_set_color(c_red);
draw_rectangle(x + x_offset, y + y_offset, x + x_offset + health_bar_width, y + y_offset + bar_height, false);

// Reset color
draw_set_color(c_white);
  