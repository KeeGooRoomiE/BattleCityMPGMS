depth=-98989898
if !(instance_exists(obj_pad_dpad))
{
//draw_sprite(spr_button,1,mouse_x,mouse_y)
draw_sprite_ext(spr_button, 1, mouse_x, mouse_y, 0.3, 0.3, image_angle, image_blend, image_alpha);


}else if (instance_exists(obj_pad_dpad))
{
	//draw_sprite(spr_button,1,device_mouse_x(1),device_mouse_y(1))
	draw_sprite_ext(spr_button, 1, device_mouse_x(1),device_mouse_y(1), 0.3, 0.3, image_angle, image_blend, image_alpha);


}



