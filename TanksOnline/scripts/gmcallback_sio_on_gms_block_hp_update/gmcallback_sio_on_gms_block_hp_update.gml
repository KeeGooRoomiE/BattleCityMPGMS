function gmcallback_sio_on_gms_block_hp_update() {
	var data = json_decode(argument[0]);
	if (room=rm3_game){
		for (var i = 0; i < array_length(global.briks); i += 1)
		{
			var srid = real(array_get(global.briks[i], 3))
			if (real(srid) == real(data[? "bindex"]))
			{
				array_set(global.briks[i],2,data[? "hp"]) // HP
				array_set(global.briks[i],4,data[? "gotDamageFrom"]); // Сторона попадания 1 - 4
				if (data[? "hp"] == 2)
				{
					ObjPlayer.alarm[4]=15
					//global.trayayaya="agent007"
				}
			}
		}
	}
}