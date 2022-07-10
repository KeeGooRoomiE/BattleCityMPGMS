/// sio_emit_create_player()
/// @descr Send player creation packet to the server
randomize()
function sio_emit_create_player() {
	var eventName = "create_player";
#region packet
		var data = ds_map_create();
			data[? "user_id"] = global.user_id; 
			data[? "imageindex"] = global.mytank;	
			data[? "spriteindex"] = global.st_index;
			data[? "tankcolor"] = global.tank_color;
			data[? "hp"] = global.hp;
			data[? "room"] = global.roomid;
			data[? "battle"] = global.battle_id;
			data[? "direction"] = 180;
			data[? "imageangle"] = 180;
			data[? "amount"] = global.amount;
			data[? "username"] = global.username;
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion


}
