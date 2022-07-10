if ( (global.bb > 0) and  !(global.bbtimer >= global.bbtimermax) )
{
	global.bbtimer+=1
}

		
    if ( global.bbtimer>=(global.bbtimermax*1) )
       { bbtimertrue=8;}

    if ( (global.bbtimer>(global.bbtimermax*0.875)) and (global.bbtimer<(global.bbtimermax*1)) )
       { bbtimertrue=7;}

    if ( (global.bbtimer>(global.bbtimermax*0.750)) and (global.bbtimer<(global.bbtimermax*0.875)) )
       { bbtimertrue=6;}
		
    if ( (global.bbtimer>(global.bbtimermax*0.625)) and (global.bbtimer<(global.bbtimermax*0.750)) )
       { bbtimertrue=5;}
		
    if ( (global.bbtimer>(global.bbtimermax*0.500)) and (global.bbtimer<(global.bbtimermax*0.625)) )
	   { bbtimertrue=4;}
		
    if ( (global.bbtimer>(global.bbtimermax*0.375)) and (global.bbtimer<(global.bbtimermax*0.500)) )
       { bbtimertrue=3;}
		
    if ( (global.bbtimer>(global.bbtimermax*0.250)) and (global.bbtimer<(global.bbtimermax*0.375)) )
       { bbtimertrue=2;}
		
    if ( (global.bbtimer>(global.bbtimermax*0.125)) and (global.bbtimer<(global.bbtimermax*0.250)) )
       { bbtimertrue=1;}
	   
    if ( global.bbtimer<=(global.bbtimermax*0.125) )
       { bbtimertrue=0;}
