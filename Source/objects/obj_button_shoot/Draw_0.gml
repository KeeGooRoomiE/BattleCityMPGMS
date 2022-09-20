// work
if !(instance_exists(obj_pad_dpad))
{
draw_sprite(spr_button,1,mouse_x,mouse_y)
}else if (instance_exists(obj_pad_dpad))
{
	draw_sprite(spr_button,1,device_mouse_x(1),device_mouse_y(1))
}



