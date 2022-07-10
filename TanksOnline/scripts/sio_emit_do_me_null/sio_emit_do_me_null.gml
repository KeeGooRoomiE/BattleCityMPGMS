function sio_emit_do_me_null() {
	var eventName = "do_me_null";
	
#region packet
		var data = ds_map_create();
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion
}
