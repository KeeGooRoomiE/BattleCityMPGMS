
if (txtdata == "NFTs")
{
	image_xscale=2.8
	image_yscale=2.8
	draw_sprite_ext(s_btn1, 3, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
else if (txtdata == "START")
{
	image_xscale=3.2
	image_yscale=3.2
	draw_sprite_ext(s_btn1, 2, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}else{
	image_xscale=2.8
	image_yscale=2.8
	draw_self()
}

draw_set_font(fnt_init_rm)

draw_set_halign(fa_center)
draw_set_valign(fa_center)

/*if (active)
{
draw_set_color(c_white)
}else{*/
draw_set_color(c_white)
//}
draw_text(x,y,string(txtdata))

//draw_text(x,y,"TANK INDEX: "+string(global.mytank))
//draw_text(x-480,y+60,"SPR INDEX: "+string(global.st_index))
