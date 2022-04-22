	
	var xinput = 0
	var yinput = 0

	if !(keyboard_check(vk_right) or keyboard_check(vk_right) or keyboard_check(vk_up) or keyboard_check(vk_down))
	{
	xinput = (keyboard_check(ord("D")) && place_free(x + collisionSpeed,y)) - (keyboard_check(ord("A")) && place_free(x - collisionSpeed,y));
	yinput = (keyboard_check(ord("S")) && place_free(x,y + collisionSpeed)) - (keyboard_check(ord("W")) && place_free(x,y - collisionSpeed));
	if keyboard_check(ord("A")){direction = 180}    
	else if keyboard_check(ord("D")){direction = 0}    
	else if keyboard_check(ord("W")){direction = 90}    
	else if keyboard_check(ord("S")){direction = 270}  
	}
	
	
	
	if !(keyboard_check(ord("A")) or keyboard_check(ord("W")) or keyboard_check(ord("S")) or keyboard_check(ord("D")))
	{
	xinput = (keyboard_check(vk_right) && place_free(x + collisionSpeed,y)) - (keyboard_check(vk_left) && place_free(x - collisionSpeed,y));
	yinput = (keyboard_check(vk_down) && place_free(x,y + collisionSpeed)) - (keyboard_check(vk_up) && place_free(x,y - collisionSpeed));
	
	if keyboard_check(vk_left){direction = 180}    
	else if keyboard_check(vk_right){direction = 0}    
	else if keyboard_check(vk_up){direction = 90}    
	else if keyboard_check(vk_down){direction = 270}   
	
	}

	// No diagonal movement
	if (xinput != 0)
	{
		yinput = 0;    
	}
	x += xinput * move_speed;
	y += yinput * move_speed;

	
	//image_angle = direction;
speed=global.length*2;
//global.dir - 0-359
//direction 0,90,180,270
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
	image_angle = direction;
//direction = floor( global.dir / 90 ) * 90;
//image_index = direction*2;


