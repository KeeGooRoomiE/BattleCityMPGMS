init()
global.username = get_string("Enter username","")
room_goto(rm2_start)

global.isMapGen = true;

global.mapArray[0,0]=0;

for (i=0; i<81; i++)
{
	global.mapArray[i,i] = 0;
}
//true - creating map
//false - load map
