function sio_emit_bb_destroy(argument0,argument1) {
	var eventName = "bb_destroy";

#region packet
		var data = ds_map_create();
			data[? "bbindex"] = string(argument0);
			data[? "bbonus"] = string(argument1);
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion
}