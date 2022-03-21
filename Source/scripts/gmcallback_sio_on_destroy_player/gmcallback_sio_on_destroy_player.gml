function gmcallback_sio_on_destroy_player() {

	var data = json_decode(argument[0]);
	if (instance_exists(Obj_other_Player))
	{
		with(Obj_other_Player){
			if(real(playerId) == real(data[? "id"])){
				instance_destroy();
				break;
			}
		}
	}
	if (instance_exists(ObjPlayer))
	{
			with(ObjPlayer){
			if(real(playerId) == real(data[? "id"])){
				instance_destroy();
				room_goto(rm4_end);
				break;
			}
		}
	}
}
