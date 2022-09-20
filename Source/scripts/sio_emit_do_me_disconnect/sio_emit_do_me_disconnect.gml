function sio_emit_do_me_disconnect() {
	var eventName = "do_me_disconnect";
	
#region packet
		var data = ds_map_create();
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion
}
