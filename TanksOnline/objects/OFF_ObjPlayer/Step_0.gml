var movekey = 0

	#region -- Keyboard contorls
	var moveLeft =  ( keyboard_check(vk_left) or keyboard_check(ord("A")) )		//bool
	var moveRight = ( keyboard_check(vk_right) or keyboard_check(ord("D")) )	//bool
	var moveUp = ( keyboard_check(vk_up) or keyboard_check(ord("W")) )			//bool
	var moveDown = ( keyboard_check(vk_down) or keyboard_check(ord("S")) )		//bool
	#endregion
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