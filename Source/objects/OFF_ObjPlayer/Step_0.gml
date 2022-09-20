<<<<<<< HEAD
var movekey = 0

=======
///@description Tank Movement

//var _vx = camera_get_view_x(view_camera[0]);
//var _vy = camera_get_view_y(view_camera[0]);

activate_region();
>>>>>>> parent of 120574d (-)
	#region -- Keyboard contorls
	var moveLeft =  ( keyboard_check(vk_left) or keyboard_check(ord("A")) )		//bool
	var moveRight = ( keyboard_check(vk_right) or keyboard_check(ord("D")) )	//bool
	var moveUp = ( keyboard_check(vk_up) or keyboard_check(ord("W")) )			//bool
	var moveDown = ( keyboard_check(vk_down) or keyboard_check(ord("S")) )		//bool
	#endregion
<<<<<<< HEAD
	if (keyboard_check(vk_shift)) {move_speed = 3 * 3}else{move_speed = 3}
	#region -- Set dirs from keyboard
	if (moveLeft) { direction = 180; movekey=4; };
	if (moveRight) { direction = 0; movekey=6; };
	if (moveUp) { direction = 90; movekey=8; };
	if (moveDown) { direction = 270; movekey=2; };
	
	//var move = (moveUp or moveDown or moveRight or moveLeft);
	/*
	if (move)
	{image_speed=1}else{image_speed=0}
	*/
	#endregion
switch(movekey){
case 8:
if (!place_meeting(x, y-cell_height, o_wall))
if(place_snapped(cell_width, cell_height))
    y_dest -= cell_height
    break;
case 2:
if (!place_meeting(x, y+cell_height, o_wall))
if(place_snapped(cell_width, cell_height))
    y_dest += cell_height
    break;
case 4:
if (!place_meeting(x-cell_width, y, o_wall))
if(place_snapped(cell_width, cell_height))
    x_dest -= cell_width
    break;
case 6:
if (!place_meeting(x+cell_width, y, o_wall))
if(place_snapped(cell_width, cell_height))
    x_dest += cell_width
    break;
}




if (point_distance(x,y, x_dest, y_dest) > move_speed){
move_towards_point(x_dest, y_dest, move_speed);
}else{
speed=0
x = x_dest;
y = y_dest;
}
image_angle = direction;
=======

	#region -- Set dirs from keyboard
	if (moveLeft) { direction = 180; };
	if (moveRight) { direction = 0; };
	if (moveUp) { direction = 90; };
	if (moveDown) { direction = 270; };
	
	var move = (moveUp or moveDown or moveRight or moveLeft);
	#endregion
	
	#region --  Check collisions
	var xx = x + lengthdir_x(1,direction);
	var yy = y + lengthdir_y(1,direction);
	
	if ( place_free(xx,yy) )
	{
		speed = move*move_speed;
		canMoveDpad = true
		//show_debug_message("PLACEFREE");
	} else
	{
		speed = 0;
		canMoveDpad = false;
		//show_debug_message("PLACEBLOCK");
	}
	#endregion
	
	#region -- Dpad controls
if ( global.padEnable = true )
{
	
	speed=move_speed*canMoveDpad;//global.length*2;
	
	if ( in_range(global.dir,316,359) ) or (in_range(global.dir,0,44) )
	{
		direction = 0;
		//image_angle = 0;
	}

	if ( in_range(global.dir,45,134) )
	{
		direction = 90;
		//image_angle = 90;
	}

	if ( in_range(global.dir,135,224) )
	{
		direction = 180;
		//image_angle = 180;
	}

	if ( in_range(global.dir,225,315) )
	{
		direction = 270;
		//image_angle = 270;
	}
}
#endregion

image_angle = direction;

var vx = camera_get_view_x(view_camera[0]);
var vy = camera_get_view_y(view_camera[0]);

var vw = camera_get_view_width(view_camera[0]);
var vh = camera_get_view_height(view_camera[0]);


if device_mouse_check_button_pressed((0),mb_any)
    {
    //instance_create(device_mouse_x(0),device_mouse_y(0),obj_mbp0)

	if ( point_in_rectangle(device_mouse_x(0), device_mouse_y(0), vx, vy, vx+vw/2, vy+vh) )
	{
		// FISRT PART
		//SHOOTING
	
	
		show_debug_message("PLAYER PRESSED MOVING SIDE");
		if (!global.padEnable)
		{
		
			global.cx = window_view_mouse_get_x(0);
			global.cy = window_view_mouse_get_y(0);
		
			instance_create_depth(global.cx,global.cy,-9999,obj_pad_dpad);
		
			global.padEnable = true;
		}
	
	}
	
    }
if device_mouse_check_button_pressed((1),mb_any)
    {
    //instance_create(device_mouse_x(1),device_mouse_y(1),obj_mbp1)
	
		if ( point_in_rectangle(device_mouse_x(1), device_mouse_y(1), (vx+vw/2)+1, vy, vx+vw, vy+vh) )
		{
			//MOVEMENT PART
			//MOVING
			show_debug_message("PLAYER PRESSED SHOOTING SIDE");
	
			instance_create_depth(device_mouse_x(1),device_mouse_y(1),depth-1,obj_button_shoot);

		}
    }
	
>>>>>>> parent of 120574d (-)
