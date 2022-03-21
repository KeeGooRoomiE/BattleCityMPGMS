/// sio_init()
function sio_init() {
	gml_pragma("global", "sio_init()");

#region macros
	//srvip = "http://127.0.0.1:3000"
	
if (!file_exists(working_directory + "srvip.ini"))
{
	var srvip = "http://127.0.0.1:3003"
}else{
	
	var file = file_text_open_read(working_directory + "srvip.ini");
	var srvip = file_text_readln(file)
	file_text_close(file)
}
	#macro URL string(srvip)
#endregion

#region SocketIO
		sio_connect_by_url(URL);
#endregion

#region SocketIO:Events
// Блока
		//от клиента
		sio_addEvent("create_block");
		sio_addEvent("block_hp_mm");
		//от сервера
		sio_addEvent("send_block");
		sio_addEvent("gms_block_hp_update");
		sio_addEvent("destroy_block");
		

// Пуля
		//от клиента
		sio_addEvent("create_bullet");
		//от сервера
		sio_addEvent("send_bullet");
		sio_addEvent("send_bullet_self");

// Сообщение	
		//от клиента
		sio_addEvent("create_message");
		//от сервера
		sio_addEvent("message_update");

// Игрок
		//от клиента
		sio_addEvent("create_player");
		sio_addEvent("position_update");
		sio_addEvent("player_hp_mm");
		sio_addEvent("deth_player");
		sio_addEvent("do_me_disconnect");
		//от сервера
		sio_addEvent("create_player_other");
		sio_addEvent("gms_player_hp_update_loc");
		sio_addEvent("gms_player_hp_update_all");
		sio_addEvent("destroy_player");
		sio_addEvent("pong");
		sio_addEvent("datax_update");
		sio_addEvent("gms_update");
#endregion
}
