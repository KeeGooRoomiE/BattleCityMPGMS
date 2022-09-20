/// Move player to mouse
if(isLocalPlayer){
	x = mouse_x;
	y = mouse_y;
	
	//Send our new position to the server
	sio_emit_position_update();
}