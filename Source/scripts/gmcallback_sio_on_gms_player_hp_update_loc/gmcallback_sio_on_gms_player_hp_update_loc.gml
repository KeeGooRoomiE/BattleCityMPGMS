<<<<<<< HEAD
function gmcallback_sio_on_gms_player_hp_update_loc() {
	var data = json_decode(argument[0]);
if (room=rm3_game)
	{
		if (global.roomid = data[? "room"])
		{
			with(ObjPlayer){ 
					if(real(playerId) == real(data[? "id"]))
					{
						global.hp = data[? "hp"];
						//hp = data[? "hp"];
						audio_play_sound(hit_me_hpm, 10, false);
					}
			}
		}
	}
}

=======
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

>>>>>>> parent of 120574d (-)
 