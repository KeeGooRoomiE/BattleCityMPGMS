function sio_emit_do_me_update() {
	var eventName = "do_me_update";

#region packet
		var data = ds_map_create();
			//data[? "bindex"] = string(argument0);
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion
}