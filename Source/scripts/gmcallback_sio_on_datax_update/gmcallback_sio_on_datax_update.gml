<<<<<<< HEAD
function gmcallback_sio_on_datax_update() {
	var data = json_decode(argument[0]);
	if (room=rm3_game)
	{
		if (global.roomid = data[? "room"])
		{
		with(Obj_other_Player){
				if(real(playerId) == real(data[? "id"])){
					if(!isLocalPlayer) {
						//direction = data[? "direction"];
						image_alpha = data[? "image_alpha"];
						imageangle = data[? "direction"];
						bb = data[? "bb"];
					}
				}
			}
		}
	}
}
=======
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
>>>>>>> parent of 120574d (-)
