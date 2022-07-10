function sio_emit_block_hp_mm(argument0,argument1,argument2) {
	var eventName = "block_hp_mm";

#region packet
		var data = ds_map_create();
			data[? "bindex"] = string(argument0);
			data[? "damage"] = real(argument1);
			data[? "gotDamageFrom"] = string(argument2);
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion
}