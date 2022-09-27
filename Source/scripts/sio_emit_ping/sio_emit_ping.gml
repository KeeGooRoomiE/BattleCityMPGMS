function sio_emit_ping(){

	var eventName = "ping";

#region packet
		var data = ds_map_create();
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion


}
