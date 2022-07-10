function gmcallback_sio_on_if_u_online() {
	var data = json_decode(argument[0]);
	var ifrec = string(data[? "ifrec"]);
	if (ifrec == "yes")
	{
	instance_deactivate_layer("MyTANK")
	instance_deactivate_layer("TXTs")
	instance_deactivate_layer("BTN_TCOLOR")
	instance_deactivate_layer("BTN")
	instance_deactivate_layer("TANKS")
	instance_deactivate_layer("PRO")
	instance_deactivate_layer("NFTs")
	instance_deactivate_layer("BG_CHOOSE")
	instance_deactivate_layer("Assets_1")
	instance_create_layer(960,576,"SYS",o_start)
	}
}