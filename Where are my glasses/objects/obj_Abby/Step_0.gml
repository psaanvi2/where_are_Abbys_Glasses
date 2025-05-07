// ######################## INPUT #####################
move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
move_x *= move_speed
var jump_pressed = keyboard_check_pressed(vk_space); // var make it local variable just for this page 

// ######################## COLLISION CHECKS ###############
// Check if standing on the ground 
is_grounded = place_meeting(x, y+2, ground_object);

// Check if touching a ladder 
is_climbing = place_meeting(x, y, ladder_object);

// ABBY COLIDES WITH COIN GO TO NEXT ROOM 
if (place_meeting(x, y, obj_coin)) {
	room_goto_next();
	audio_play_sound(coin_recieved_230517, 9, false);
}
    

if (place_meeting(x, y, obj_glasses)){
    room_goto_next();
}
// ######################## MOVEMENT ########################

    // Climbing
if (is_climbing) {
	move_y = keyboard_check(vk_down) - keyboard_check(vk_up);
	move_y *= climb_speed;
}
else {
	// Gravity & Jumping 
	if ( is_grounded && jump_pressed) {
	move_y = jump_speed;
	audio_play_sound(cartoon_jump_6462, 10, false);
	}
	// Falling due to Gravity
	else if (move_y < max_fall_speed) {
		move_y += gravity_force; // Gravity pulls down!
	}
 }
// ######################## MOVE THE PLAYER ######################## 
move_and_collide(move_x, move_y, ground_object);
 
//  ######################## OUTSIDE ROOM ######################## 
if (x < -20 || x > room_width + 20 || y > room_height + 20 || y < -200) {
	room_restart(); // Restart the room if outside the boundaries we set
}
