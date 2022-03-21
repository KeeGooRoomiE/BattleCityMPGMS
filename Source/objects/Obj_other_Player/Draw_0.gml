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
