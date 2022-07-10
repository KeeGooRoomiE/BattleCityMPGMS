function sio_emit_if_i_online() {
	var eventName = "if_i_online";
	
#region packet
		var data = ds_map_create();
			data[? "user_id"] = global.user_id; //  id MP
			data[? "room"] = global.roomid; // Battle id MP
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion
}



