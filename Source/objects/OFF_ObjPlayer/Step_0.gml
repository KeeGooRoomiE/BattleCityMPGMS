/*
	var xinput = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	var yinput = keyboard_check(ord("S")) - keyboard_check(ord("W"));

	if keyboard_check(ord("A")) {direction = 180}         //left
	else if keyboard_check(ord("D")) {direction = 0}     //right
	else if keyboard_check(ord("W")) {direction = 90}   //up
	else if keyboard_check(ord("S")) {direction = 270} //down

	image_angle = direction

    
	// No diagonal movement
	if (xinput != 0)
	{
	    yinput = 0;    
	}
*/

speed=global.length*2
direction = floor( global.dir / 90 ) * 90;
//image_index = direction*2;
/*
	x += xinput * move_speed
	y += yinput * move_speed;
	

	if (place_meeting(x, y, obj_sand_tile))
	{
	move_speed = 1;
	}else {move_speed = 2;}


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





*/


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




