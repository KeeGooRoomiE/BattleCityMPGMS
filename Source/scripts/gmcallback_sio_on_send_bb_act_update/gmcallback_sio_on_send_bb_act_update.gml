function gmcallback_sio_on_send_bb_act_update() {
	var data = json_decode(argument[0]);
	if (room=rm3_game)
	{
		for (var i = 0; i < array_length(global.bonbon); i += 1)
		{
			var srid = real(array_get(global.bonbon[i], 3))
			if (real(srid) == real(data[? "bbindex"]))
			{
			array_set(global.bonbon[i],4,1)
			}
		}
	}
}

 