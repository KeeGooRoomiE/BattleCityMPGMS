	if ( place_meeting(x,y,OFF_ObjPlayer) )
	{
		if (can>1)
		{
			itimer-=1

			if i(timer>256){first++}
			if (itimer<255){first=255 second--}

			if (itimer<=1)
			{
				game_restart()
			}
		}
	}else if ( !place_meeting(x,y,OFF_ObjPlayer) ){
	itimer=tstart
	first=0
	second=255
	can++
	}

image_blend = make_colour_rgb(second, first , 0);