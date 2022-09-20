function sio_emit_do_me_bcreate() {
	var eventName = "do_me_bcreate";
	
#region packet
		var data = ds_map_create();
			data[? "room_id"] = global.roomid;

			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion
}
