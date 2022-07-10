function gmcallback_sio_on_info_user()
{
	var data = json_decode(argument[0]);
	global.pro = string(data[? "pro"]);
	//if (!test == "undefined")
	//show_message(string(test))
}

