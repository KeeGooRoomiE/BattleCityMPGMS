x=+30
y=+25

if (mouse_check_button(mb_left)){
	if ( position_meeting(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),id))
	{
		if (can)
		{
			if ( real(global.volume)==0 )
			{
				audio_master_gain(0.5)
				image_index=1
				global.volume=1
				sio_emit_svol(1);
			}
			else if ( real(global.volume)==1 )
			{
				audio_master_gain(1)
				image_index=2
				global.volume=2
				sio_emit_svol(2);
			}
			else if ( real(global.volume)==2 )
			{
				audio_master_gain(0)
				image_index=0
				global.volume=0
				sio_emit_svol(0);
			}
		}
	can=0
	alarm[0]=3
	}
}

if ( real(global.volume)==0 ) //0
			{
				audio_master_gain(0)
				image_index=0
				global.volume=0
			}
else if ( real(global.volume)==1 ) //05
			{
				audio_master_gain(0.5)
				image_index=1
				global.volume=1
			}
else if ( real(global.volume)==2 ) //0
			{
				audio_master_gain(1)
				image_index=2
				global.volume=2
			}
