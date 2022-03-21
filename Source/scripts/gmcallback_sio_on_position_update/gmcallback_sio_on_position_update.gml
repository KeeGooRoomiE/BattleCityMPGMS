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
