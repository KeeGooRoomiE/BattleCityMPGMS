function gmcallback_sio_on_send_bullet_self() {
	var data = json_decode(argument[0]);
	if (room=rm3_game)
	{
	var bb = instance_create_layer(data[? "x"], data[? "y"],"PLAYER", o_bullet);
		audio_play_sound(player_shot, 10, false);
		bb.speed = data[? "speed"];
		bb.damage = data[? "damage"];
		bb.direction = data[? "direction"];
		bb.ibullet = data[? "ibullet"];
		bb.image_speed=0
		bb.image_index=0
		bb.image_xscale = 0.11;
		bb.image_yscale = 0.11;
		bb.alarm[0]=180

		var pas = 0;
		if (data[? "direction"]==0){pas = 3}// 3 - с лево прилетело
		if (data[? "direction"]==90){pas = 4}// 4 - с низу прилетело
		if (data[? "direction"]==180){pas = 1}// 1 - с права прилетело
		if (data[? "direction"]==270){pas = 2}// 2 - с верху прилетело
	
		bb.image_angle = data[? "direction"];
		bb.damageSide = real(pas); 
	}
		

}
