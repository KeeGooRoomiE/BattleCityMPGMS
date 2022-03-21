function gmcallback_sio_on_create_player_other() {
	var data = json_decode(argument[0]);
	
	with(instance_create_depth(data[? "x"], data[? "y"], -2, Obj_other_Player)) {
		isLocalPlayer = false;
	
		playerId = data[? "id"];
		username = data[? "username"];
		imageindex = data[? "imageindex"];
		hp = data[? "hp"];
		imageangle = data[? "imageangle"];
	}


}
