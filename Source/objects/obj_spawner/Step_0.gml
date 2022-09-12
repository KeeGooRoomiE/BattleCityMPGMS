	if ( place_meeting(x,y,ObjPlayer) )
	{
		if (can>1)
		{
			itimer-=1
		

			if (itimer>256){first++}
			if (itimer<255){first=255 second--}

			if (itimer<=1)
			{
				sio_emit_do_me_disconnect()
				instance_destroy()
			}
		}
	}else if ( !place_meeting(x,y,ObjPlayer) ){
	itimer=tstart
	first=0
	second=255
	can++
	}

image_blend = make_colour_rgb(second, first , 0);