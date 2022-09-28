
	var vx = camera_get_view_x(view_camera[0]);
	var vy = camera_get_view_y(view_camera[0]);

	var vw = camera_get_view_width(view_camera[0]);
	var vh = camera_get_view_height(view_camera[0]);


	if device_mouse_check_button_pressed((0),mb_any)
	   {
		 if ( point_in_rectangle(device_mouse_x(0), device_mouse_y(0), vx, vy, vx+vw/2, vy+vh) )
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
	   }
	   
	 if device_mouse_check_button_pressed((1),mb_any)
	   {
		  if ( point_in_rectangle(device_mouse_x(1), device_mouse_y(1), (vx+vw/2)+1, vy, vx+vw, vy+vh) )
			{
				//MOVEMENT PART
				//MOVING
				//show_debug_message("PLAYER PRESSED SHOOTING SIDE");
				if (can_shoote)
					{
					sio_emit_create_bullet()
					can_shoote=0
					alarm[1]=40
					}
				instance_create_depth(device_mouse_x(1),device_mouse_y(1),depth-1,obj_button_shoot);
			} 
	   }
