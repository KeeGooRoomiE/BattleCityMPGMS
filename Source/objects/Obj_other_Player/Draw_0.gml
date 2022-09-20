<<<<<<< HEAD
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_color(c_white);
draw_set_font(ftArial);
image_speed=0
if (real(hp)>=1)
{
	draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, real(imageangle), image_blend, image_alpha); 
	//draw_sprite_ext(s_hp,real(hp),x,y-110,0.75, 0.75, image_angle, image_blend, image_alpha);
	//draw_text_ol(x,y-170,string(username),$ffffff,$000000);
	//event_perform_object(o_wall, 0, 0);
}else if (real(hp)<=0)
{
	instance_destroy();
}
=======
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_set_color(c_white);
draw_set_font(FntGame)

	if (real(hp)>=1)
	{
	draw_sprite_ext(sprite_index, real(imageindex), x, y, image_xscale, image_yscale, real(imageangle), image_blend, image_alpha);
	draw_sprite(s_hp,real(hp),x,y-60);
	draw_text_ol(x,y-45,"ID" + string(playerId) +" "+ string(username),$10de16,$1f1d1d);
	event_perform_object(o_wall, 0, 0);
	}else if (real(hp)<=0){
	instance_destroy();
	}
>>>>>>> parent of 120574d (-)
