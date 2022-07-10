function gmcallback_sio_on_gvol()
{
	var data = json_decode(argument[0]);
	global.volume = real(data[? "vol"]);
}

