/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_set_font(FntGame)


if (global.lang=1)
{
draw_text_ol(x,y,"Вы оффлайн! # Нажмите ок, # чтобы переподключиться",$10de16,$1f1d1d)
}
if (global.lang=0)
{
draw_text_ol(x,y,"Disconnected! # Press ok # to reconnect",$10de16,$1f1d1d)
}
