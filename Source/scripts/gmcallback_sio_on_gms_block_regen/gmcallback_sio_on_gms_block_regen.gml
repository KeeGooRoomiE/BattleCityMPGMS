function gmcallback_sio_on_gms_block_regen() {
	var data = json_decode(argument[0]);
	if (room=rm3_game)
	{
		for (var i = 0; i < array_length(global.briks); i += 1)
		{
			var srid = real(array_get(global.briks[i], 3))
			if (real(srid) == real(data[? "bindex"]))
			{
				if !( (data[? "gotDamageFrom"] = array_get(global.briks[i], 4)) or
				(data[? "hp"] = array_get(global.briks[i], 2)) or
				(data[? "x"] = array_get(global.briks[i], 0)) or
				(data[? "y"] = array_get(global.briks[i], 1)) )
				{
					array_set(global.briks[i],2,data[? "hp"]) // HP
					array_set(global.briks[i],4,data[? "gotDamageFrom"]); // Сторона попадания 1 - 4
					array_set(global.briks[i],0,data[? "x"]); 
					array_set(global.briks[i],1,data[? "y"]); 
				}
			}
		}
	}
}

 