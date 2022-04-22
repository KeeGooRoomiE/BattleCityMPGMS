///@description Tank Movement
	
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
		show_debug_message("PLACEFREE");
	} else
	{
		speed = 0;
		canMoveDpad = false;
		show_debug_message("PLACEBLOCK");
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


