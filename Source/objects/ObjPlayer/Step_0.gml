<<<<<<< HEAD
if(isLocalPlayer){
	
//instance_deactivate_layer("BOOM");
instance_deactivate_layer("BUSH");
//instance_deactivate_layer("DULO");
instance_deactivate_layer("GROUND");
instance_deactivate_layer("BRICK");
//instance_deactivate_layer("ENEMY_BULLET");
instance_deactivate_layer("WALL");
//instance_deactivate_layer("PLAYER");
instance_deactivate_layer("WATER");
instance_deactivate_layer("SAND");

	var _vx = camera_get_view_x(view_camera[0]);
	var _vy = camera_get_view_y(view_camera[0]);
	var _vw = camera_get_view_width(view_camera[0]);
	var _vh = camera_get_view_height(view_camera[0]);
	instance_activate_region( _vx + 40, _vy + 40, _vw + 40 ,_vh + 40, true);

///@description Tank Movement
var movekey = 0

#region -- Keyboard contorls
	var moveLeft =  ( keyboard_check(vk_left) or keyboard_check(ord("A")) )		//bool
	var moveRight = ( keyboard_check(vk_right) or keyboard_check(ord("D")) )	//bool
	var moveUp = ( keyboard_check(vk_up) or keyboard_check(ord("W")) )			//bool
	var moveDown = ( keyboard_check(vk_down) or keyboard_check(ord("S")) )		//bool
#endregion
	
#region -- Set dirs from keyboard
	if (moveLeft) { direction = 180; movekey=4; };
	if (moveRight) { direction = 0; movekey=6; };
	if (moveUp) { direction = 90; movekey=8; };
	if (moveDown) { direction = 270; movekey=2; };
#endregion

	if (global.bb==6)
	{
	image_alpha = 0.1
	}else{
	image_alpha = 1
	}
	global.i_a = image_alpha;
	

switch(movekey){
case 8:
if (!place_meeting(x, y-cell_height, o_wall))
if(place_snapped(cell_width, cell_height))
    y_dest -= cell_height
	sio_emit_position_update();
    break;
case 2:
if (!place_meeting(x, y+cell_height, o_wall))
if(place_snapped(cell_width, cell_height))
    y_dest += cell_height
	sio_emit_position_update();
    break;
case 4:
if (!place_meeting(x-cell_width, y, o_wall))
if(place_snapped(cell_width, cell_height))
    x_dest -= cell_width
	sio_emit_position_update();
    break;
case 6:
if (!place_meeting(x+cell_width, y, o_wall))
if(place_snapped(cell_width, cell_height))
    x_dest += cell_width
	sio_emit_position_update();
    break;
}



//var move = (moveUp or moveDown or moveRight or moveLeft);

	if (point_distance(x,y, x_dest, y_dest) > move_speed){
	move_towards_point(x_dest, y_dest, move_speed);
	//image_speed=1
	sio_emit_position_update();
	}else{
	speed=0
	//image_speed=0
	x = x_dest;
	y = y_dest;
	}

image_angle = direction;
//sio_emit_position_update();

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////

	
	#region -- Dpad controls
if ( global.padEnable = true )
{
	
	sio_emit_position_update();
	if ( in_range(global.dir,316,359) ) or (in_range(global.dir,0,44) )
	{
		direction = 0;
		//image_angle = 0;
		if (!place_meeting(x+cell_width, y, o_wall))
		if(place_snapped(cell_width, cell_height))
		    x_dest += cell_width
	}

	if ( in_range(global.dir,45,134) )
	{
		direction = 90;
		//image_angle = 90;
		if (!place_meeting(x, y-cell_height, o_wall))
		if(place_snapped(cell_width, cell_height))
		    y_dest -= cell_height
	}

	if ( in_range(global.dir,135,224) )
	{
		direction = 180;
		//image_angle = 180;
		if (!place_meeting(x-cell_width, y, o_wall))
		if(place_snapped(cell_width, cell_height))
		    x_dest -= cell_width
	}

	if ( in_range(global.dir,225,315) )
	{
		direction = 270;
		//image_angle = 270;
		if (!place_meeting(x, y+cell_height, o_wall))
		if(place_snapped(cell_width, cell_height))
		    y_dest += cell_height
	}
	
	if (point_distance(x,y, x_dest, y_dest) > move_speed){
	move_towards_point(x_dest, y_dest, move_speed);
	//image_speed=1
	}
}
#endregion

image_angle = direction;

///////////////////////////////////////////////
	
	
	

	if (place_meeting(x, y, obj_water) and !(global.bb=2))
	{
	obj_water.sprite_index = spr_water_nowall
	}else{
		obj_water.sprite_index = spr_water_wall
	}

	
	if (global.bb==4)
	{
	bb4=1.25;
	}else{bb4=1}
	
	/*
	if (global.bb==7)
	{
	bb7=1.1;
	}else{bb7=1}
	*/
	
	if (place_meeting(x, y, obj_sand_tile))
	{
	move_speed = 1.5; // TODO
	}else {move_speed =3*bb4;} // TODO
	
	if ( global.user_id == 958056345 or global.user_id == 1966891044 )
		{
		if (keyboard_check(vk_shift)) {move_speed = 3 * 3}else{move_speed = 3*bb4}
		}
	
	/// Move player SERVER 1
	//sio_emit_position_update();
	sio_emit_datax_update();
	
	
	/*
	switch (keyboard_key)
	{
	    case vk_numpad1: sio_emit_create_bb(mouse_x,mouse_y,1); break;
	    case vk_numpad2: sio_emit_create_bb(mouse_x,mouse_y,2); break;
	    case vk_numpad3: sio_emit_create_bb(mouse_x,mouse_y,3); break;
	    case vk_numpad4: sio_emit_create_bb(mouse_x,mouse_y,4); break;
	    case vk_numpad5: sio_emit_create_bb(mouse_x,mouse_y,5); break;
	    case vk_numpad6: sio_emit_create_bb(mouse_x,mouse_y,6); break;
	    case vk_numpad7: sio_emit_create_bb(mouse_x,mouse_y,7); break;
	    case vk_numpad8: sio_emit_create_bb(mouse_x,mouse_y,8); break;
	    case vk_numpad9: sio_emit_create_bb(mouse_x,mouse_y,9); break;
	}
	*/
	
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
	   
} // локал плауер








=======
if(isLocalPlayer){
	var xinput = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	var yinput = keyboard_check(ord("S")) - keyboard_check(ord("W"));

	if keyboard_check(ord("A")) {direction = 180}         //left
	else if keyboard_check(ord("D")) {direction = 0}     //right
	else if keyboard_check(ord("W")) {direction = 90}   //up
	else if keyboard_check(ord("S")) {direction = 270} //down

	image_angle = direction
	global.gms_imageangle=direction

    
	// No diagonal movement
	if (xinput != 0)
	{
	    yinput = 0;    
	}




	x += xinput * move_speed
	y += yinput * move_speed;
	
/// Move player SERVER 1
		sio_emit_position_update();
		sio_emit_datax_update();
/// Move player SERVER 0

	if (place_meeting(x, y, o_pesok))
	{
	move_speed = 4;
	}else {move_speed = 6.3;}


	if (x > xprevious)
	{
	    while (place_meeting(x, y, o_wall))
	    {
	        x--;
	    }  
	}
	else if (x < xprevious)
	{
	    while (place_meeting(x, y, o_wall))
	    {
	        x++;
	    }      
	}
	else if (y > yprevious)
	{
	    while (place_meeting(x, y, o_wall))
	    {
	        y--;
	    }      
	}
	else if (y < yprevious)
	{
	    while (place_meeting(x, y, o_wall))
	    {
	        y++;
	    }      
	}

}






if (browser_height > window_get_height()) || (browser_width > window_get_width())
{
    var xx, yy;
    if (browser_width > window_get_width())
    {
        xx = (browser_width - window_get_width()) / 2;
    }
    else
    {
        xx = 0;
    }
    if (browser_height > window_get_height())
    {
        yy = (browser_height - window_get_height()) / 2;
    }
    else
    {
        yy = 0;
    }
    window_set_position(xx, yy);
}




>>>>>>> parent of 120574d (-)
