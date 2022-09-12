function sio_emit_toserv_bullet_destroy(argument0) {
	var eventName = "toserv_bullet_destroy";
	
#region packet
		var data = ds_map_create();
			data[? "ibullet"] = real(argument0);
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion
}
