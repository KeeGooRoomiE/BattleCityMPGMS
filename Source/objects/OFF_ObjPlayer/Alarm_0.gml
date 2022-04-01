/// @description Delete all obstacles at start
// You can write your code in this editor

if ( place_meeting(x,y,o_wall) )
{
	var i=instance_place(x,y,o_wall);
	instance_destroy(i);
}