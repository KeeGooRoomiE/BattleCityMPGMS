function sio_emit_block_destroy(argument0) {
	var eventName = "block_destroy";

#region packet
		var data = ds_map_create();
			data[? "bindex"] = string(argument0);
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion
}