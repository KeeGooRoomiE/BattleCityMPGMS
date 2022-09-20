<<<<<<< HEAD
//global.fli = 1
var bul = instance_create_depth(x,y,-1,o_bullet_new);

audio_play_sound(player_shot, 10, false);
bul.speed= 20
bul.direction = direction
bul.image_angle = image_angle;
=======
if (can_shoote)
	{
	var bb = instance_create(x,y,OFF_o_bullet)
	bb.direction = direction;
	bb.image_angle = direction;
			var pas = 0;
		if (direction==0){pas = 3}// 3 - с лево прилетело
		if (direction==90){pas = 4}// 4 - с низу прилетело
		if (direction==180){pas = 1}// 1 - с права прилетело
		if (direction==270){pas = 2}// 2 - с верху прилетело
	
		bb.damageSide = real(pas); 
	bb.speed = 3;
	can_shoote=0
	alarm[1]=40
	}
>>>>>>> parent of 120574d (-)
