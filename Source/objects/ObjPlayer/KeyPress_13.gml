/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе
mytextmessage = get_string("Введите тест","тест смс серверу");
sio_emit_create_message(string(mytextmessage))