if(isLocalPlayer){
	if (can_shoote)
	{
	sio_emit_create_bullet()
	can_shoote=0
	alarm[1]=40
	}
}