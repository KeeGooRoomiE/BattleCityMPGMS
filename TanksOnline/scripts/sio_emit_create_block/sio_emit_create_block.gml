function sio_emit_create_block(argument0,argument1,argument2,argument3,argument4) {
	var eventName = "create_block";
	
#region packet
		var data = ds_map_create();
			data[? "x"] = real(argument0);
			data[? "y"] = real(argument1);
			data[? "blayer"] = string(argument2);
			data[? "obb"] = string(argument3);
			data[? "hp"] = real(argument4);
			data[? "room"] = global.roomid;
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion
}
