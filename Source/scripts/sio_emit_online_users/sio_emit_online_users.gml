function sio_emit_online_users() {
	var eventName = "online_users";
	
#region packet
		var data = ds_map_create();
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion
}
