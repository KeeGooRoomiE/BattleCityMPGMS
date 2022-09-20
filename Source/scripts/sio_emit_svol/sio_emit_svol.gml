/// sio_emit_create_player()
/// @descr Send player creation packet to the server
function sio_emit_svol(argument0) {
	var eventName = "svol";
	
#region packet
		var data = ds_map_create();
			data[? "svol"] = string(argument0);
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion
}
