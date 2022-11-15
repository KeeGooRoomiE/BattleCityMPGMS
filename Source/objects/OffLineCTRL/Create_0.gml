wview = browser_width;
hview = browser_height;
room_speed = 25
instance_create_depth(1,1,1,o_money_2)
instance_create_depth(1,1,1,o_vol_2)
//draw_sprite(s_vol,1,wview*0.03,hview*0.06)
for (var i = 0; i < instance_number(obj_spawner_OFF); ++i;)
{
	    enemy[i] = instance_find(obj_spawner_OFF,i)
	
	
	if (instance_exists(o_kirpich))
	{
		if (!instance_position(enemy[i].x, enemy[i].y, o_kirpich)) // Другой игрок  (вп=ременно кирпич)
			{
			instance_create_layer(enemy[i].x,enemy[i].y,"PLAYER",OFF_ObjPlayer)
			break;
			}
	}
	else{
		instance_create_layer(enemy[i].x,enemy[i].y,"PLAYER",OFF_ObjPlayer)
		break;
	}
}