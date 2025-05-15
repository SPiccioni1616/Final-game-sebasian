      //######################### IMPUTS #########################\\
	  // determain left or right movment\\
	  move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
	  move_x *= move_speed;
	  // check if jumping 
	  
	  var jump_pressed = keyboard_check_pressed(vk_up); // var makes the variable local to this event 
	  
	  
	  //######################### check for collitions #########################\\
	 //  check if standing on ground 
	 is_grounded = place_meeting(x, y+2, obj_ground)
	  
	  
	  //check if touching ladder
	//  is_climbing = place_meeting(x, y, obj_ladder)
	  
	  
	  
	  //####################### MOVEMENT ################################\\
	  //climbing 
	  if (is_climbing) {
		  move_y = keyboard_check(vk_down) - keyboard_check(vk_up); 
		  move_y *= climb_speed;
	  }
	  
	  else {
		  // jumping \\
		  if (is_grounded && jump_pressed) {
			  move_y = jump_speed;
		  }
		  else if (move_y <max_fall_speed) {
			move_y += gravity_force;  
		  }
	  }
	  
	  // ################# ACTUALLY MOVE THE PLAYER OBJECT #########################################\\
	  
	  
	  
	  
	  move_and_collide(move_x, move_y, obj_ground);
	  
	  
	  
	  
	  // ################# outside room  #################\\
	  
	  if (y < -300 || y > room_height+300) {
		  room_restart(); // restart room if object is outside the room
	  }
	  
	  
	  
	  //########################## health
	  
	  
	  // Check if health is 0 or below
//if (health <= 0) {
//    health = 0;  // Make sure health doesn't go below 0

 

//    // Restart the current room
//    room_restart();
//}

//################### changeing sprites ###################\\


// If the player is grounded and moving
//else if (is_grounded) {
  //  if (move_x != 0) {
        // If moving left, set the walk left sprite
 //       if (move_x < 0) {
//            sprite_index = spr_mainguybarkworks;
 //       }
        // If moving right, set the walk right sprite
  //      else if (move_x > 0) {
     //       sprite_index = spr_mainguyfoward;
 //       }
//    }
//    else {
        // If not moving, set the idle sprite
//        sprite_index = spr_mainguyidle;
//    }
//}
// If the player is in the air (jumping or falling)
//else {
    // Set the jump sprite (both for left and right movement)
 //   sprite_index = spr_mainguyjump;
//}