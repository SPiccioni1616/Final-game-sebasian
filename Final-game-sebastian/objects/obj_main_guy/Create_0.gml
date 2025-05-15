     //######################### movment veriables #########################\\
move_speed = 3;      //left/right
jump_speed = -12;     // upwords jump speed
climb_speed = 3;   //climbing speed
gravity_force =0.5; //gravity strengh 
max_fall_speed =10;// max downword speed
move_x =0;        //horizontal movment
move_y =0;       // vertival movment 


 //######################### state variables #########################\\
 is_grounded = false; //on ground
 is_climbing = false;// on ladder
 
 
 
 
 
 //##### coin collection #####\\
 
 total_cure = instance_number(obj_cure);
 
 can_advance = false;
 
 cure = 0;
//total_coins = instance_number(obj_coin);
can_advance = false;


//#################### health stystem ####################\\

// Player Health Initialization
health = 100;  // Starting health (you can change this to any value)
max_health = 100;  // Maximum health



