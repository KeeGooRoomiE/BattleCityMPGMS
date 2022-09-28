
	//Generator
	sandPrec = irandom_range(6,8);		//8-10
	waterPrec = irandom_range(3,6);		//5-8
	grassPrec = irandom_range(8,13);	//10-15
	metPrec = irandom_range(3,8);		//5-10
	brickPrec = irandom_range(13,18);	//15-20
	
	

	allPrec = brickPrec+metPrec+grassPrec+waterPrec+sandPrec;
	//show_debug_message("Overall placement is "+string(allPrec)+" %");

	sandRangeMin = allPrec-sandPrec;
	sandRangeMax = allPrec;

	waterRangeMin = sandRangeMin-waterPrec;
	waterRangeMax = sandRangeMin

	grassRangeMin = waterRangeMin-grassPrec;
	grassRangeMax = waterRangeMin;

	metRangeMin = grassRangeMin-metPrec;
	metRangeMax = grassRangeMin;

	brickRangeMin = metRangeMin-brickPrec;
	brickRangeMax = metRangeMin;
	
	BlockBonusMax = 200;

	bs=64; // размер блоков
	xv=room_width/bs; // количество блоков горизонтально
	yv=room_height/bs; // количество блоков вертикально
	spc=64;

	for (i=0; i<xv; i++)
	{
		for (j=0; j<yv; j++)
		{
		
			var r = irandom_range(0,100);
		
			if (r > allPrec)
			{
				//empty one
				//show_debug_message("Block " + string(i) + ":" +  string(j) + " is empty");
			
				if (spc > 0)
				{
					if (irandom(100) > 98)
					{
						//instance_create_layer( (bs/2) + (i*bs), (bs/2) + (j*bs), "SAND", obj_spawner);
						//sio_emit_create_block( (bs/2) + (i*bs), (bs/2) + (j*bs),"SAND","obj_spawner",1)
						//show_debug_message("Block " + string(i) + ":" +  string(j) + " is spawner point now");
						spc-=1;
					}
				}
			} else
			{
				if ( in_range(r,sandRangeMin,sandRangeMax) )
				{
					//show_debug_message("Seems its a sand");
					//instance_create_layer( (bs/2) + (i*bs), (bs/2) + (j*bs), "Floor", obj_sand_tile);
					sio_emit_create_block( (bs/2) + (i*bs), (bs/2) + (j*bs),"SAND","obj_sand_tile",1)
				}
			
				if ( in_range(r,waterRangeMin,waterRangeMax) )
				{
					//show_debug_message("There is a water");
					//instance_create_layer( (bs/2) + (i*bs), (bs/2) + (j*bs), "Floor", obj_water);
					sio_emit_create_block( (bs/2) + (i*bs), (bs/2) + (j*bs), "WATER","obj_water",1)
				}
			
				if ( in_range(r,grassRangeMin,grassRangeMax) )
				{
					//show_debug_message("Grass placed there");
					//instance_create_layer( (bs/2) + (i*bs), (bs/2) + (j*bs), "Roof", obj_grass);
					sio_emit_create_block( (bs/2) + (i*bs), (bs/2) + (j*bs),"BUSH","obj_grass",1)
				}
			
				if ( in_range(r,metRangeMin,metRangeMax) )
				{
					//show_debug_message("Seems its a sand");
					//instance_create_layer( (bs/2) + (i*bs), (bs/2) + (j*bs), "Obstacles", obj_metal_wall);
					sio_emit_create_block( (bs/2) + (i*bs), (bs/2) + (j*bs),"WALL","obj_metal_wall",2)
				}
			
				if ( in_range(r,brickRangeMin,brickRangeMax) )
				{
					//show_debug_message("Its a brick wall");
					//instance_create_layer( (bs/2) + (i*bs), (bs/2) + (j*bs), "Obstacles", obj_brick_wall);
					sio_emit_create_block( (bs/2) + (i*bs), (bs/2) + (j*bs),"BRICK","obj_brick_wall",2)
					//randomize()
					var can = choose(0,0,0,0,0,0,0,0,0,1,0,0,0,0,0)
					if (can)
					{
						if ( BlockBonusMax > 0)
						{
						BlockBonus = irandom_range(1,6);
						sio_emit_create_bb( (bs/2) + (i*bs), (bs/2) + (j*bs),real(BlockBonus));
						BlockBonusMax--;
						}
					}
				}
			}
		}
	}