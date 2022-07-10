/// sio_emit_create_player()
/// @descr Send player creation packet to the server
function sio_emit_create_message(argument0) {
	var eventName = "create_message";
	
#region packet
		var data = ds_map_create();
			data[? "gms_msg"] = string(argument0);
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion
}
