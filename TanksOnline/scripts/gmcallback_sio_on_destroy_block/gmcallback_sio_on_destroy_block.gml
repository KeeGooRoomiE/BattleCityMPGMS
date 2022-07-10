function gmcallback_sio_on_destroy_block() {

	var data = json_decode(argument[0]);
	if (room=rm3_game){
		for (var i = 0; i < array_length(global.briks); i += 1)
		{
			var srid = real(array_get(global.briks[i], 3))
			if (real(srid) == real(data[? "bindex"]))
			{
			array_set(global.briks[i],2,0) // HP
			}
		}
	}
}