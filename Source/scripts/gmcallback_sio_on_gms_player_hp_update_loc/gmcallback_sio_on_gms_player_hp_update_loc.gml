function gmcallback_sio_on_gms_player_hp_update_loc() {
	var data = json_decode(argument[0]);
	//через масив TODO


		with(ObjPlayer){ //TODO!!
			if(real(playerId) == real(data[? "id"]))
			{
				global.hp = data[? "hp"];
				//hp = data[? "hp"];
			}
	}
}

 