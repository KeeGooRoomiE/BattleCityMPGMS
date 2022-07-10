function gmcallback_sio_on_block_gen() {
	var data = json_decode(argument[0]);	
	
	var ans = real(data[? "qw"]);
	if (ans)
	{
		instance_create(0,0,obj_controller)
	}
}
