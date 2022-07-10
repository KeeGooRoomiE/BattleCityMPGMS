function gmcallback_sio_on_destroy_player() {

	var data = json_decode(argument[0]);
	if (room=rm3_game){	
		if (global.roomid = data[? "room"])
		{
			if (instance_exists(Obj_other_Player))
			{
				with(Obj_other_Player){
					if(real(user_id) == real(data[? "user_id"])){
						instance_destroy();
					}
				}
			}
			if (instance_exists(ObjPlayer))
			{
					with(ObjPlayer){
					if(real(user_id) == real(data[? "user_id"])){
					with(oController){alarm[4]=30*9}
					with(o_dulo){instance_destroy()}
					audio_play_sound(death, 10, false);
					instance_deactivate_layer("BOOM");
					instance_deactivate_layer("BUSH");
					instance_deactivate_layer("DULO");
					instance_deactivate_layer("GROUND");
					instance_deactivate_layer("BRICK");
					instance_deactivate_layer("ENEMY_BULLET");
					instance_deactivate_layer("WALL");
					instance_deactivate_layer("PLAYER");
					instance_deactivate_layer("WATER");
					instance_deactivate_layer("SAND");
					//instance_destroy() // TODO_DESTRPL
					isLocalPlayer=false
					visible=false
					ic = instance_create(x,y,o_Explosion)
					ic.image_xscale = 0.75;
					ic.image_yscale = 0.75;
					}
				}
			}
		}
	}
}
