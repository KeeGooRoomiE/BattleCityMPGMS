function gmcallback_sio_on_up_online_users()
{
	var data = json_decode(argument[0]);
	global.p_online = string(data[? "plrmle"]);
	//if (!test == "undefined")
	//show_message(string(test))
}

