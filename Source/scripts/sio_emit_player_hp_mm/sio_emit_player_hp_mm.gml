<<<<<<< HEAD
function sio_emit_player_hp_mm(argument0,argument1) {
	var eventName = "player_hp_mm";

#region packet
		var data = ds_map_create();
			data[? "user_id"] = real(argument0);
			data[? "damage"] = real(argument1);
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion
=======
function sio_emit_player_hp_mm(argument0,argument1) {
	var eventName = "player_hp_mm";

#region packet
		var data = ds_map_create();
			data[? "playerId"] = real(argument0);
			data[? "damage"] = real(argument1);
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion
>>>>>>> parent of 120574d (-)
}