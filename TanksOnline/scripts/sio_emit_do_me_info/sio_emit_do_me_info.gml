function sio_emit_do_me_info() {
	var eventName = "do_me_info"; // rm3_game
	
#region packet
		var data = ds_map_create();
			data[? "user_id"] = global.user_id; //  id MP
			data[? "room"] = global.roomid; //  id MP
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion
}

