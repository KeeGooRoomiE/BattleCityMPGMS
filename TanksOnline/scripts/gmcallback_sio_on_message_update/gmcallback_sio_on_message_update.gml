function gmcallback_sio_on_message_update()
{
	var data = json_decode(argument[0]);
	test = data[? "gms_msg"];
	//if (!test == "undefined")
	//show_message(string(test))
}

