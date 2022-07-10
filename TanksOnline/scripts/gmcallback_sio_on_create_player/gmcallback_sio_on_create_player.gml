function gmcallback_sio_on_create_player() {
	var data = json_decode(argument[0]);
	if (room=rm3_game)
	{
		instance_create(1,1,o_money_2)
		instance_create(1,1,o_vol_2)

			var ispaw = irandom_range(0, instance_number(obj_sand_tile));
			var ioispaw = instance_find(obj_sand_tile,ispaw)
			var xx,yy;
			xx=ioispaw.x
			yy=ioispaw.y
		if (instance_exists(Obj_other_Player))
		{
			if (!instance_position(xx,yy,Obj_other_Player))
			{
				with(instance_create_layer(xx, yy, "PLAYER", ObjPlayer))
				{
					isLocalPlayer = true;
					user_id = data[? "user_id"]; 
					playerId = data[? "id"];
					username = data[? "username"]; 
					image_index = data[? "imageindex"];
					sprite_index = data[? "spriteindex"];
					image_blend = data[? "tankcolor"];
					global.hp = data[? "hp"];
					x=xx
					y=yy
				}
			}else{
				for (var i=0; i < instance_number(obj_sand_tile);i++)
				{
					plcreate[i] = instance_find(obj_sand_tile,i)
					if (!instance_position(plcreate[i].x,plcreate[i].y,Obj_other_Player))
					{
						with(instance_create_layer(xx, yy, "PLAYER", ObjPlayer))
						{
							isLocalPlayer = true;
							user_id = data[? "user_id"]; 
							playerId = data[? "id"];
							username = data[? "username"]; 
							image_index = data[? "imageindex"];
							sprite_index = data[? "spriteindex"];
							image_blend = data[? "tankcolor"];
							global.hp = data[? "hp"];
							x=plcreate[i].x
							y=plcreate[i].y
						}
					break;
					}
				}
			}
		}else{
			with(instance_create_layer(xx, yy, "PLAYER", ObjPlayer))
			{
				isLocalPlayer = true;
				user_id = data[? "user_id"]; 
				playerId = data[? "id"];
				username = data[? "username"]; 
				image_index = data[? "imageindex"];
				sprite_index = data[? "spriteindex"];
				image_blend = data[? "tankcolor"];
				global.hp = data[? "hp"];
				x=xx
				y=yy
			}
		}
	}
}
