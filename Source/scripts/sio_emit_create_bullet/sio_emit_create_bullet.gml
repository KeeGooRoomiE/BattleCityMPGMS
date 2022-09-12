function sio_emit_create_bullet() {
	var eventName = "create_bullet";
	
#region packet
		var data = ds_map_create();
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion
}
