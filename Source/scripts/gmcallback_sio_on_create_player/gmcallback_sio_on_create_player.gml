function gmcallback_sio_on_create_player() {
	var data = json_decode(argument[0]);

	with(instance_create_depth(data[? "x"], data[? "y"], -2, ObjPlayer)) {
		isLocalPlayer = true;
	
		playerId = data[? "id"];
		username = data[? "username"];
		imageindex = data[? "imageindex"];
		hp = data[? "hp"];
		imageangle = data[? "imageangle"];
	}


}
