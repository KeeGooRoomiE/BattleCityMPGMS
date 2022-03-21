function gmcallback_sio_on_send_block() {
	var data = json_decode(argument[0]);
	
	var bb = instance_create_depth(data[? "x"], data[? "y"], -2,o_blok);
		bb.hp = data[? "hp"];
		bb.bindex = data[? "bindex"];
		
}
