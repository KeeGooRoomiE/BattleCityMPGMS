// Ресурсы скриптов были изменены для версии 2.3.0, подробности см. по адресу
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function sendcmd(){
mytextmessage = get_string("Введите команду","myinfo");
sio_emit_create_message(string(mytextmessage))
}