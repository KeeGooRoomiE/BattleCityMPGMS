function gmcallback_sio_on_send_bullet() {
	var data = json_decode(argument[0]);
	if (room=rm3_game)
	{
	if (global.roomid = data[? "room"])
		{
		var bb = instance_create_layer(data[? "x"], data[? "y"], "ENEMY_BULLET" ,o_bullet_en);
		
			bb.speed = data[? "speed"];
			bb.ibullet = data[? "ibullet"];
			bb.damage = data[? "damage"];
			bb.direction = data[? "direction"];
			bb.image_angle = data[? "direction"];
		
			bb.image_speed=0
			bb.image_index=0
			bb.image_xscale = 0.11;
			bb.image_yscale = 0.11;
		}
	}
	
}
