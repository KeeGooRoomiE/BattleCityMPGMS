function gmcallback_sio_on_datax_update() {
	var data = json_decode(argument[0]);

	with(Obj_other_Player){
		if(real(playerId) == real(data[? "id"])){
			if(!isLocalPlayer) {
				imageangle = data[? "imageangle"];
			}
		}
	}
}
