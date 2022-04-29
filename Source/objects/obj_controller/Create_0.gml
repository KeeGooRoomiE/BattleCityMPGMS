/// @description Preload variables
global.briks[0] = []; // здесь будут храниться все созданные блоки кирпича
global.briksId = 0; // уникальный идентификатор для каждого блока кирпича
//Dpad
global.dir=90                           //Dpad Direction
global.length=0                         //Dpad Length
global.padEnable = false;
global.cx = 0;
global.cy = 0;
//Generator

sandPrec = irandom_range(8,10);		//8-10
waterPrec = irandom_range(5,8);		//5-8
grassPrec = irandom_range(10,15);	//10-15
metPrec = irandom_range(5,10);		//5-10
brickPrec = irandom_range(15,20);	//15-20

allPrec = brickPrec+metPrec+grassPrec+waterPrec+sandPrec;
show_debug_message("Overall placement is "+string(allPrec)+" %");

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

xv=80;
yv=80;

bs=16;

spc=64;
/*
for (i=0; i<xv; i++)
{
	for (j=0; j<yv; j++)
	{
		
		//TODO: Добавить занесение в массив
		
		var r = irandom_range(0,100);
		
		if (r > allPrec)
		{
			//empty one
			show_debug_message("Block " + string(i) + ":" +  string(j) + " is empty");
			
			if (spc > 0)
			{
				if (irandom(100) > 98)
				{
					instance_create_layer( (bs/2) + (i*bs), (bs/2) + (j*bs), "Floor", obj_spawner);
					show_debug_message("Block " + string(i) + ":" +  string(j) + " is spawner point now");
					spc-=1;
				}
			}
		} else
		{
			if ( in_range(r,sandRangeMin,sandRangeMax) )
			{
				show_debug_message("Seems its a sand");
				instance_create_layer( (bs/2) + (i*bs), (bs/2) + (j*bs), "Floor", obj_sand_tile);
			}
			
			if ( in_range(r,waterRangeMin,waterRangeMax) )
			{
				show_debug_message("There is a water");
				instance_create_layer( (bs/2) + (i*bs), (bs/2) + (j*bs), "Floor", obj_water);
			}
			
			if ( in_range(r,grassRangeMin,grassRangeMax) )
			{
				show_debug_message("Grass placed there");
				instance_create_layer( (bs/2) + (i*bs), (bs/2) + (j*bs), "Roof", obj_grass);
			}
			
			if ( in_range(r,metRangeMin,metRangeMax) )
			{
				show_debug_message("Seems its a sand");
				instance_create_layer( (bs/2) + (i*bs), (bs/2) + (j*bs), "Obstacles", obj_metal_wall);
			}
			
			if ( in_range(r,brickRangeMin,brickRangeMax) )
			{
				show_debug_message("Its a brick wall");
				instance_create_layer( (bs/2) + (i*bs), (bs/2) + (j*bs), "Obstacles", obj_brick_wall);
			}
		}
		
		
		

			/*
			show_debug_message("Its a brick wall");
			instance_create_layer( (bs/2) + (i*bs), (bs/2) + (j*bs), "Obstacles", obj_brick_wall);
			*/
			
			/*
			show_debug_message("Seems its a sand");
			instance_create_layer( (bs/2) + (i*bs), (bs/2) + (j*bs), "Floor", obj_sand_tile);
			*/
		
			//empty one
			//show_debug_message("Block " + string(i) + ":" +  string(j) + " is empty");
	
	
	//}
//}



