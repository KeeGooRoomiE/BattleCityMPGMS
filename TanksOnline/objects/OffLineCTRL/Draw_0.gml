draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_set_font(fnt_minimap24)
var tarasbulba = "Username";

with (OFF_ObjPlayer)
{

			draw_sprite_ext(s_hp,3,x,y-140,0.35, 0.35, image_angle, image_blend, image_alpha);
			draw_set_colour(c_orange);
			draw_text(x,y-170,string(tarasbulba));

}

