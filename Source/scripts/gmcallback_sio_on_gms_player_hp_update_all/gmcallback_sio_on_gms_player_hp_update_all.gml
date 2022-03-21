function gmcallback_sio_on_gms_player_hp_update_all() {
	var data = json_decode(argument[0]);
	//через масив TODO
	
			with(Obj_other_Player){ //TODO!!
			if(real(playerId) == real(data[? "id"]))
			{
				hp = data[? "hp"];
			}
	}
	
			with(ObjPlayer){ //TODO!!
			if(real(playerId) == real(data[? "id"]))
			{
				global.hp = data[? "hp"];
				hp = data[? "hp"];
			}
	}
}

 