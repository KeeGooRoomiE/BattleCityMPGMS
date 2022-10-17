draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(fnt_minimap)
draw_set_color(c_white)

image_alpha=0.8
draw_sprite_ext(spr_bal_resize_1, 1, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.8);


if (global.amount<10)
{
draw_sprite_ext(spr_bal_resize_2, 1, x+63, y, image_xscale, image_yscale, image_angle, image_blend, 0.8);
draw_sprite_ext(spr_bal_resize_3, 1, x+63+29, y, image_xscale, image_yscale, image_angle, image_blend, 0.8);
draw_text(x+50,y+30,string(string_format(global.amount,10,2)))
}
if ( (global.amount>=10) and (global.amount<100) )
{
draw_sprite_ext(spr_bal_resize_2, 1, x+63, y, image_xscale, image_yscale, image_angle, image_blend, 0.8);
draw_sprite_ext(spr_bal_resize_2, 1, x+63+29, y, image_xscale, image_yscale, image_angle, image_blend, 0.8);
draw_sprite_ext(spr_bal_resize_3, 1, x+63+29+29, y, image_xscale, image_yscale, image_angle, image_blend, 0.8);
draw_text(x+60,y+30,string(string_format(global.amount,10,2)))
}
if ( (global.amount>=100) and (global.amount<1000) )
{
draw_sprite_ext(spr_bal_resize_2, 1, x+63, y, image_xscale, image_yscale, image_angle, image_blend, 0.8);
draw_sprite_ext(spr_bal_resize_2, 1, x+63+29, y, image_xscale, image_yscale, image_angle, image_blend, 0.8);
draw_sprite_ext(spr_bal_resize_2, 1, x+63+29+29, y, image_xscale, image_yscale, image_angle, image_blend, 0.8);
draw_sprite_ext(spr_bal_resize_3, 1, x+63+29+29+29, y, image_xscale, image_yscale, image_angle, image_blend, 0.8);
draw_text(x+70,y+30,string(string_format(global.amount,10,2)))
}
if ( (global.amount>=1000) and (global.amount<10000) )
{
draw_sprite_ext(spr_bal_resize_2, 1, x+63, y, image_xscale, image_yscale, image_angle, image_blend, 0.8);
draw_sprite_ext(spr_bal_resize_2, 1, x+63+29, y, image_xscale, image_yscale, image_angle, image_blend, 0.8);
draw_sprite_ext(spr_bal_resize_2, 1, x+63+29+29, y, image_xscale, image_yscale, image_angle, image_blend, 0.8);
draw_sprite_ext(spr_bal_resize_2, 1, x+63+29+29+29, y, image_xscale, image_yscale, image_angle, image_blend, 0.8);
draw_sprite_ext(spr_bal_resize_3, 1, x+63+29+29+29+29, y, image_xscale, image_yscale, image_angle, image_blend, 0.8);
draw_text(x+80,y+30,string(string_format(global.amount,10,2)))
}
if ( (global.amount>=10000) and (global.amount<100000) )
{
draw_sprite_ext(spr_bal_resize_2, 1, x+63, y, image_xscale, image_yscale, image_angle, image_blend, 0.8);
draw_sprite_ext(spr_bal_resize_2, 1, x+63+29, y, image_xscale, image_yscale, image_angle, image_blend, 0.8);
draw_sprite_ext(spr_bal_resize_2, 1, x+63+29+29, y, image_xscale, image_yscale, image_angle, image_blend, 0.8);
draw_sprite_ext(spr_bal_resize_2, 1, x+63+29+29+29, y, image_xscale, image_yscale, image_angle, image_blend, 0.8);
draw_sprite_ext(spr_bal_resize_2, 1, x+63+29+29+29+29, y, image_xscale, image_yscale, image_angle, image_blend, 0.8);
draw_sprite_ext(spr_bal_resize_3, 1, x+63+29+29+29+29+29, y, image_xscale, image_yscale, image_angle, image_blend, 0.8);
draw_text(x+90,y+30,string(string_format(global.amount,10,2)))
}
if (global.amount>=100000) 
{
draw_sprite_ext(spr_bal_resize_2, 1, x+63, y, image_xscale, image_yscale, image_angle, image_blend, 0.8);
draw_sprite_ext(spr_bal_resize_2, 1, x+63+29, y, image_xscale, image_yscale, image_angle, image_blend, 0.8);
draw_sprite_ext(spr_bal_resize_2, 1, x+63+29+29, y, image_xscale, image_yscale, image_angle, image_blend, 0.8);
draw_sprite_ext(spr_bal_resize_2, 1, x+63+29+29+29, y, image_xscale, image_yscale, image_angle, image_blend, 0.8);
draw_sprite_ext(spr_bal_resize_2, 1, x+63+29+29+29+29, y, image_xscale, image_yscale, image_angle, image_blend, 0.8);
draw_sprite_ext(spr_bal_resize_2, 1, x+63+29+29+29+29+29, y, image_xscale, image_yscale, image_angle, image_blend, 0.8);
draw_sprite_ext(spr_bal_resize_3, 1, x+63+29+29+29+29+29+29, y, image_xscale, image_yscale, image_angle, image_blend, 0.8);
draw_text(x+100,y+30,string(string_format(global.amount,10,2)))
}
