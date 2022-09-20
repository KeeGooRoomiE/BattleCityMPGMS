function gmcallback_sio_on_gms_player_hp_update_all() {
	var data = json_decode(argument[0]);

	if (room=rm3_game){
			with(Obj_other_Player)
			{
					if(real(playerId) == real(data[? "id"]))
					{
						hp = data[? "hp"];
					}
			}
	
			with(ObjPlayer)
			{

					if(real(playerId) == real(data[? "id"]))
					{
						global.hp = data[? "hp"];
						hp = data[? "hp"];
					
						audio_play_sound(hit_me_hpm, 10, false);
					}
			
			}
	}
}

 