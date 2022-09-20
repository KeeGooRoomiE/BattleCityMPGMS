/// @description Moving
<<<<<<< HEAD
cx = camera_get_view_x(view_camera[0]) + dx;
cy = camera_get_view_y(view_camera[0]) + dy;
=======

>>>>>>> parent of 120574d (-)

if point_in_circle(mouse_x,mouse_y,cx,cy,96)
{
    x=mouse_x
    y=mouse_y
    lenght_a=point_distance(x,y,cx,cy)
    dir_a=point_direction(cx,cy,x,y)
    global.dir=dir_a
    global.length=lenght_a/96
}
else
{
    x=cx+lengthdir_x(96,point_direction(cx,cy,mouse_x,mouse_y))
    y=cy+lengthdir_y(96,point_direction(cx,cy,mouse_x,mouse_y))
    lenght_a=point_distance(x,y,cx,cy)
    dir_a=point_direction(cx,cy,x,y)
    global.dir=dir_a;
	//show_debug_message("DIR?"+string(global.dir));
    global.length=lenght_a/96
}