<<<<<<< HEAD
/*
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_color(c_white);
draw_set_font(ftArial);

if(isLocalPlayer){
	if (global.hp>=1)
	{
		draw_sprite_ext(sprite_index, real(imageindex), x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
		draw_sprite(s_hp,real(global.hp),x,y-45)
		draw_text_ol(x,y-20,string(global.bb)+" "+string(username),$10de16,$1f1d1d);
	}
}else{
	if (real(hp)>=1)
	{
	draw_sprite_ext(sprite_index, real(imageindex), x, y, image_xscale, image_yscale, real(imageangle), image_blend, image_alpha);
	draw_sprite(s_hp,real(hp),x,y-45)
	draw_text_ol(x,y-20,string(username),$10de16,$1f1d1d);
	}
}
*/


//TRUE!
/*
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_color(c_white);
draw_set_font(ftArial);

		draw_sprite_ext(sprite_index, real(imageindex), x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
		draw_sprite(s_hp,real(global.hp),x,y-45)
		draw_text_ol(x,y-20,string(global.bb)+" "+string(username),$10de16,$1f1d1d);
*/
draw_self();
=======
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_set_color(c_white);
draw_set_font(FntGame)

if(isLocalPlayer){
	if (global.hp>=1)
	{
		draw_sprite_ext(sprite_index, real(imageindex), x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
		draw_sprite(s_hp,real(global.hp),x,y-60)
		draw_text_ol(x,y-45,"ID" + string(playerId) +" "+ string(username),$10de16,$1f1d1d);
	}
}else{
	if (real(hp)>=1)
	{
	draw_sprite_ext(sprite_index, real(imageindex), x, y, image_xscale, image_yscale, real(imageangle), image_blend, image_alpha);
	draw_sprite(s_hp,real(hp),x,y-60)
	draw_text_ol(x,y-45,"ID" + string(playerId) +" "+ string(username),$10de16,$1f1d1d);
	}
}
>>>>>>> parent of 120574d (-)
