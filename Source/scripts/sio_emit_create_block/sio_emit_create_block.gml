function sio_emit_create_block(argument0,argument1,argument2) {
	var eventName = "create_block";
	
#region packet
		var data = ds_map_create();
			data[? "x"] = real(argument0);
			data[? "y"] = real(argument1);
			data[? "hp"] = real(argument2);
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion
}
