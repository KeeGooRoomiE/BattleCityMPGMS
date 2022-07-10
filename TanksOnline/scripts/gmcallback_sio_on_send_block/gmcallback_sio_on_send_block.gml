function gmcallback_sio_on_send_block() {
	var data = json_decode(argument[0]);	
	if (room=rm3_game)
	{
		if (global.roomid = data[? "room"])
		{
		var bb = instance_create_layer(data[? "x"], data[? "y"], data[? "blayer"], asset_get_index(string(data[? "obb"])));
			bb.bindex = data[? "bindex"];
			bb.gotDamageFrom = data[? "gotDamageFrom"];
			bb.hp = data[? "hp"];
			bb.image_xscale=0.5
			bb.image_yscale=0.5
			
			global.briksId++
			var bid = real(global.briksId);
			
			bb.bid = real(global.briksId);
			global.briks[bid] = [];
		
			if ( (string(data[? "obb"]) == "obj_brick_wall") or (string(data[? "obb"]) == "obj_metal_wall") )
			{
				var bindex = real(data[? "bindex"]);
				var xx = real(data[? "x"])
				var yy = real(data[? "y"])
				var gotDamageFrom = data[? "gotDamageFrom"];
				var hp = data[? "hp"];
				array_push(global.briks[bid], xx, yy, hp,  bindex, gotDamageFrom);
			}else
			{	
				var xx = real(data[? "x"])
				var yy = real(data[? "y"])
				var bindex = real(data[? "bindex"]);
				array_push(global.briks[bid], xx, yy, 404,  bindex, 404);
			}
		}
	}
}
