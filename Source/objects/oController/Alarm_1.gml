if (room==rm3_game)
{
    base_size = 1290;
	width = browser_width; //x
	height = browser_height; //y
	canvas_fullscreen2(base_size);	
}

if (room==rm2_start)
{
	//camera_set_view_size(view_camera[0],view_wport[0], view_hport[0]);

window_set_rectangle(0, 0, browser_width, browser_height);
}

alarm[1]=30
