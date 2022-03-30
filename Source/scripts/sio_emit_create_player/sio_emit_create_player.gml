/// sio_emit_create_player()
/// @descr Send player creation packet to the server
function sio_emit_create_player() {

	var eventName = "create_player";
#region packet
		var data = ds_map_create();
			data[? "user_id"] = global.user_id; //заменить на cookieGet("user_id") - для выявлении в JS
			data[? "username"] = global.username;
			data[? "imageindex"] = real(choose(0,1,2,3,4,5,6,7));
			data[? "hp"] = global.hp;
			data[? "room"] = global.roomid;
			data[? "direction"] = direction;
			data[? "imageangle"] = 180;
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion


}
