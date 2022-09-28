/// Draw our stats
draw_set_color(c_yellow); 
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_minimap)
//draw_text(85, 5, "FPS: " + string(game_get_speed(gamespeed_fps)));
draw_text(5, 840, "\n" + "Ping: " + string(rping) + "ms");

if (browser_width<browser_height)
{
	draw_sprite(yx,1,width/2,height/2);
//show_message("Переверните экран")	
}
