if(isLocalPlayer){
	if (can_shoote)
	{
	sio_emit_create_bullet()
	global.fli = 1
	
		if !( global.user_id == 958056345 or global.user_id == 1966891044 )
		{
			if (global.bb==3)
			{
			alarm[1]=25
			}else{
			alarm[1]=35
			}
		}else
		{
			if (keyboard_check(vk_shift))
			{
			alarm[1]=10
			}else{
			if (global.bb==3)
			{
				alarm[1]=25
				}else{
				alarm[1]=35
				}
			}
		}
		
		can_shoote=0
	}
}