<<<<<<< HEAD
function gmcallback_sio_on_position_update() {
	var data = json_decode(argument[0]);
		if (room=rm3_game){
		if (global.roomid = data[? "room"])
		{
			with(Obj_other_Player){
				if(real(playerId) == real(data[? "id"])){
					if(!isLocalPlayer) {
						x = data[? "x"];
						y = data[? "y"];
					}
				}
			}
		}
	}
}
=======
function gmcallback_sio_on_position_update() {
	var data = json_decode(argument[0]);

	with(Obj_other_Player){
		if(real(playerId) == real(data[? "id"])){
			if(!isLocalPlayer) {
				x = data[? "x"];
				y = data[? "y"];
			}
		}
	}


}
>>>>>>> parent of 120574d (-)
