function sio_emit_can_i_gen() {
	var eventName = "can_i_gen";

#region packet
		var data = ds_map_create();
			data[? "room_id"] = real(global.roomid);
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion
}