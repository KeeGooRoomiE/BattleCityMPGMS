function sio_emit_create_bb(argument0,argument1,argument2) {
	var eventName = "create_bb";
	
#region packet
		var data = ds_map_create();
			data[? "x"] = real(argument0);
			data[? "y"] = real(argument1);
			data[? "bb"] = real(argument2);
			data[? "blayer"] = "Floor";
			data[? "room"] = global.roomid;
			data[? "act"] = 1;
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion
}
