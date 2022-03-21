function gmcallback_sio_on_destroy_block() {

	var data = json_decode(argument[0]);

	with(o_blok){
		if(real(bindex) == real(data[? "bindex"])){
			instance_destroy();
			break;
		}
	}
}