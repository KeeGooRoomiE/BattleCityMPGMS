function gmcallback_sio_on_gms_block_hp_update() {
	var data = json_decode(argument[0]);
	//через масив TODO
	with(o_blok){
		if(real(bindex) == real(data[? "bindex"])){
			hp = data[? "hp"];
		}
	}
}

 