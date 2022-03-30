function gmcallback_sio_on_create_player() {
	var data = json_decode(argument[0]);
	if (global.roomid = data[? "room"])
	{
		with(instance_create_depth(data[? "x"], data[? "y"], -2, ObjPlayer))
		{
			isLocalPlayer = true;
			user_id = data[? "user_id"];
			global.user_id = data[? "user_id"];
			playerId = data[? "id"];
			username = data[? "username"];
			imageindex = data[? "imageindex"];
			global.hp = data[? "hp"];
			global.roomid = data[? "room"]; 
		}
	}
}
