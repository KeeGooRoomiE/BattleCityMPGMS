function gmcallback_sio_on_block_gen() {
	var data = json_decode(argument[0]);	
	
	var ans = real(data[? "qw"]);
	if (ans)
	{
		instance_create_depth(0,0,1,obj_controller)
	}
}
