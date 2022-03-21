function sio_emit_block_hp_mm(argument0,argument1) {
	var eventName = "block_hp_mm";

#region packet
		var data = ds_map_create();
			data[? "bindex"] = real(argument0);
			data[? "damage"] = real(argument1);
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion
}