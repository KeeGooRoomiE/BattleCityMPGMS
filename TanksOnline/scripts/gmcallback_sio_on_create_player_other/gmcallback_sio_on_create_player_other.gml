function gmcallback_sio_on_create_player_other() {
	var data = json_decode(argument[0]);
	if (room=rm3_game)
	{
		if (global.roomid = data[? "room"])
		{
			with(instance_create_layer(data[? "x"], data[? "y"], "PLAYER", Obj_other_Player)) {
				isLocalPlayer = false;
				user_id = data[? "user_id"]; 
				playerId = data[? "id"];
				username = data[? "username"]; 
				image_index = data[? "imageindex"];
				sprite_index = data[? "spriteindex"];
				image_blend = data[? "tankcolor"];
				hp = data[? "hp"];
				imageangle = data[? "imageangle"];
			}
		}
	}

}
