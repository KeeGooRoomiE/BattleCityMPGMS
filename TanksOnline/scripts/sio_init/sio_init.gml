/// sio_init()
function sio_init() {
	gml_pragma("global", "sio_init()");

#region macros
	//srvip = "http://127.0.0.1:3000"
	
if (!file_exists(working_directory + "srvip.ini"))
{
	var srvip = "tanks.mindplays.games"
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
// Настройки игрока
	// от клиента
	sio_addEvent("svol"); // громкость звука
	// от сервера
	sio_addEvent("gvol"); // громкость звука


// Миникарта
	//от клиента
		sio_addEvent("online_users"); // Апдейт ми
	//от сервера
		sio_addEvent("up_online_users"); // Апдейтс


// Блока
	//от клиента
		sio_addEvent("do_me_update"); // Апдейт
		sio_addEvent("can_i_gen"); // gen start ?
		
		sio_addEvent("do_me_bcreate");
		sio_addEvent("create_block");
		sio_addEvent("block_hp_mm");
		sio_addEvent("block_destroy");
		// Блок Бонус
		sio_addEvent("create_bb");
		sio_addEvent("bb_destroy");
		
	//от сервера
		sio_addEvent("block_regen");  // Реген
		sio_addEvent("block_gen");  // gen start answer
		
		sio_addEvent("send_block");
		sio_addEvent("gms_block_hp_update");
		sio_addEvent("destroy_block");
		// Блок Бонус
		sio_addEvent("bb_s_destroy");
		sio_addEvent("send_bb");
		sio_addEvent("send_bb_act_update");
		

// Пуля
	//от клиента
		sio_addEvent("create_bullet");
		sio_addEvent("toserv_bullet_destroy");
	//от сервера
		sio_addEvent("send_bullet");
		sio_addEvent("send_bullet_self");
		sio_addEvent("fserv_bullet_destroy");

// Сообщение	
	//от клиента
		sio_addEvent("create_message");
	//от сервера
		sio_addEvent("message_update");

// Игрок
	//от клиента
		sio_addEvent("do_me_info");
		sio_addEvent("if_i_online");
		sio_addEvent("do_me_null");
		sio_addEvent("do_me_gotoroom");
		sio_addEvent("create_player");
		sio_addEvent("position_update");
		sio_addEvent("player_hp_mm");
		sio_addEvent("hp_update");
		sio_addEvent("hp_one");
		sio_addEvent("deth_player");
		sio_addEvent("do_me_disconnect");
	//от сервера
		sio_addEvent("info_user");
		
		sio_addEvent("if_u_online");
		sio_addEvent("up_money_coin");  // мани тотал
		sio_addEvent("do_gotoroom");
		sio_addEvent("create_player_other");
		sio_addEvent("gms_player_hp_update_loc");
		sio_addEvent("gms_player_hp_update_all");
		sio_addEvent("destroy_player");
		sio_addEvent("pong");
		sio_addEvent("datax_update");
		sio_addEvent("gms_update");
#endregion
}
