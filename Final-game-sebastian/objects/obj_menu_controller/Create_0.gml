menu_options = ["Start Game", "Options", "Quit"];
selected = 0;

selected = (selected - 1 + array_length(menu_options)) mod array_length(menu_options);


selected = (selected + 1) mod array_length(menu_options);

switch (selected) {
    case 0:
        room_goto(rm_game); // Replace with your main game room
        break;
    case 1:
        // room_goto(rm_options); // Placeholder for an options menu
        break;
    case 2:
        game_end(); // Quit the game
        break;
}
