draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_color(c_white);
draw_set_font(ftArial);
image_speed=0
if (real(hp)>=1)
{
	draw_sprite_ext(sprite_index, image_index, x, y, 0.5, 0.5, real(imageangle), image_blend, image_alpha); 
	//draw_sprite_ext(s_hp,real(hp),x,y-110,0.75, 0.75, image_angle, image_blend, image_alpha);
	//draw_text_ol(x,y-170,string(username),$ffffff,$000000);
	//event_perform_object(o_wall, 0, 0);
}else if (real(hp)<=0)
{
	instance_destroy();
}