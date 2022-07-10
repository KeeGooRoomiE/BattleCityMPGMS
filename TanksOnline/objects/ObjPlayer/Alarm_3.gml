
if ( place_meeting(x, y, obj_xy_place_water) and global.bb=2 ) // Если я (танк) соприкасаюсь с объектов ВОДА
{ // ТО
	alarm[3]=30*3 // Перезапускаю таймер
	
	global.bbtimer=30*3
}else // Иначе
{
	global.bb=0; // Назначаю глобальной переменной бб = 0 
	global.bbtimermax=0
	global.bbtimer=0
	sio_emit_do_me_null()// TODO send 2 server
audio_play_sound(bonus_destroy, 10, false);
}

if !( place_meeting(x, y, obj_xy_place_water) and global.bb=2 )
{
	global.bbtimermax=0
	global.bbtimer=0
	global.bb=0;
	sio_emit_do_me_null()
	
audio_play_sound(bonus_destroy, 10, false);
}