/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе

x = array_get(global.briks[bid], 0)
y = array_get(global.briks[bid], 1)
if place_meeting(x,y,ObjPlayer)
{
	image_alpha=0.5
}else{
	image_alpha=1
}