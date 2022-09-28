draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_minimap10);
var tarasbulba = ObjPlayer.username;

with (Obj_other_Player)
{
if ( (real(hp)>=1) and (!place_meeting(x,y,obj_xy_place)) )
	{
		if !(string(bb)=="6")
		{
			draw_sprite_ext(s_hp,real(hp),x,y-30,0.10, 0.10, 0.5, -1, 1);
			draw_set_colour(c_orange);
			draw_text(x,y-45,string(username));
		}
	}
}


if ( (global.hp>0) )
{
	draw_sprite_ext(Death_antibooster, real(global.bb), ObjPlayer.x, ObjPlayer.y, 0.65, 0.65, 0, -1, 0.7);
	draw_sprite_ext(spr_timer, real(bbtimertrue), ObjPlayer.x, ObjPlayer.y, 0.65, 0.65, 0, -1, 0.7);
	draw_set_colour(c_white);
	draw_sprite_ext(s_hp,real(global.hp),ObjPlayer.x,ObjPlayer.y-30,0.10, 0.10 ,0, -1, image_alpha);
	draw_text(ObjPlayer.x,ObjPlayer.y-45,string(tarasbulba));
}
