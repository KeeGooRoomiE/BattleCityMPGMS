// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

///@function in_range(val, min, max)
function in_range(argument0, argument1, argument2)
{
	if (argument1 < argument0 && argument0 < argument2 ) 
	{
		return true;
	} 
	else
	{
		return false;
	}
}