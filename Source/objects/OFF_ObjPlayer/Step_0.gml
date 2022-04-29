///@description Tank Movement

instance_deactivate_layer("Roof");
instance_deactivate_layer("Floor");
instance_deactivate_layer("Obstacles");
var _vx = camera_get_view_x(view_camera[0]);
var _vy = camera_get_view_y(view_camera[0]);
var _vw = camera_get_view_width(view_camera[0]);
var _vh = camera_get_view_height(view_camera[0]);
instance_activate_region(_vx - 10, _vy - 10, _vw - 10, _vh - 10, true);

	#region -- Keyboard contorls
	var moveLeft =  ( keyboard_check(vk_left) or keyboard_check(ord("A")) )		//bool
	var moveRight = ( keyboard_check(vk_right) or keyboard_check(ord("D")) )	//bool
	var moveUp = ( keyboard_check(vk_up) or keyboard_check(ord("W")) )			//bool
	var moveDown = ( keyboard_check(vk_down) or keyboard_check(ord("S")) )		//bool
	#endregion

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
	