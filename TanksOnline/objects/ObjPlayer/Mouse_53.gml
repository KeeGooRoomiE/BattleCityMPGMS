if(isLocalPlayer){
	
//instance_create(mouse_x,mouse_y,obj_bb)

//if !(os_type==os_windows or os_type==os_macosx or os_type==os_linux)
//{
	var vx = camera_get_view_x(view_camera[0]);
	var vy = camera_get_view_y(view_camera[0]);

	var vw = camera_get_view_width(view_camera[0]);
	var vh = camera_get_view_height(view_camera[0]);


	if ( point_in_rectangle(mouse_x, mouse_y, vx, vy, vx+vw/2, vy+vh) )
	{
		// FISRT PART
		//SHOOTING
	//show_debug_message("PLAYER PRESSED MOVING SIDE");
	 if (!global.padEnable)
	 {
  
	  global.cx = window_view_mouse_get_x(0);
	  global.cy = window_view_mouse_get_y(0);
  
	  d=instance_create_depth(global.cx,global.cy,-9999,obj_pad_dpad);
	  d.dx = global.cx - camera_get_view_x(view_camera[0]);
	  d.dy = global.cy - camera_get_view_y(view_camera[0]);
	  //show_debug_message(string(d.dx)+":"+string(d.dy));
  
	  global.padEnable = true;
	 }
	
	}

	if ( point_in_rectangle(mouse_x, mouse_y, (vx+vw/2)+1, vy, vx+vw, vy+vh) )
	{
		//MOVEMENT PART
		//MOVING
		//show_debug_message("PLAYER PRESSED SHOOTING SIDE");
		/*if (can_shoote)
			{
			sio_emit_create_bullet()
			global.fli = 1
			can_shoote=0
			alarm[1]=40
			}
			*/
		instance_create_depth(mouse_x,mouse_y,-1111111,obj_button_shoot);
	}
//}
}