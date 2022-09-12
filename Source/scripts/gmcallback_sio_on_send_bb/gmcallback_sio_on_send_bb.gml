function gmcallback_sio_on_send_bb() {
	var data = json_decode(argument[0]);	
	if (room=rm3_game)
	{
		if (global.roomid = data[? "room"])
		{
		var bb = instance_create_layer(data[? "x"], data[? "y"], "WATER", obj_bb);

	        bb.bb = data[? "bb"];
	        bb.bbindex = data[? "bbindex"];
		
				global.bonbonId++
				var bid = real(global.bonbonId);
			
				bb.bid = real(global.bonbonId);
				global.bonbon[bid] = [];
				var bbindex = real(data[? "bbindex"]);
				var xx = real(data[? "x"])
				var yy = real(data[? "y"])
				
				var bb = data[? "bb"];
				var act = data[? "act"];
				array_push(global.bonbon[bid], xx, yy,  bb, bbindex, act);
		}
	}
}
