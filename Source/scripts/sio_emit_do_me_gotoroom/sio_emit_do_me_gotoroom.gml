function sio_emit_do_me_gotoroom() {
	var eventName = "do_me_gotoroom"; // rm3_game
	
#region packet
		var data = ds_map_create();
			data[? "user_id"] = global.user_id; //  id MP
			data[? "room"] = global.roomid; // Battle id MP
			data[? "battle_id"] = global.battle_id; //  id MP
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion
}



