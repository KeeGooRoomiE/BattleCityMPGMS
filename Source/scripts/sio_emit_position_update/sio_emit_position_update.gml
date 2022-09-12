function sio_emit_position_update() {
	var eventName = "position_update";

#region packet
		var data = ds_map_create();
			data[? "x"] = x;
			data[? "y"] = y;
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion


}
