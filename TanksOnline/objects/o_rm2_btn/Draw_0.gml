draw_self()
draw_set_font(fnt_minimap24_30)

draw_set_halign(fa_center)
draw_set_valign(fa_center)

if (active)
{
draw_set_color(c_black)
}else{
draw_set_color(c_white)
}
draw_text(x,y,string(txtdata))

draw_text(x-350,y,"TANK INDEX: "+string(global.mytank))
//draw_text(x-480,y+60,"SPR INDEX: "+string(global.st_index))
