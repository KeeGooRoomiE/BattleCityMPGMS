if (txtdata == "START")
{
	instance_deactivate_layer("MyTANK")
	instance_deactivate_layer("TXTs")
	instance_deactivate_layer("BTN_TCOLOR")
	instance_deactivate_layer("BTN")
	instance_deactivate_layer("TANKS")
	instance_deactivate_layer("PRO")
	instance_deactivate_layer("NFTs")
	instance_deactivate_layer("BG_CHOOSE")
	instance_deactivate_layer("Assets_1")

	room_goto(rm5_game_OFF) // IF LOCAL TEST - 1 (clear //)
	//instance_create_layer(960,576,"SYS",o_start) //  IF LOCAL TEST - 0 (make //)
	
	
}
else if (txtdata == "TANKS")
{
	with (o_rm2_btn) {active = false}
	active = true
	
	global.nftpage = 1
	global.mytank = 1
	global.tactive= "TANKS"
	instance_deactivate_layer("PRO")
	instance_deactivate_layer("NFTs")
	
	instance_activate_layer("TANKS")
	instance_activate_layer("BTN_TCOLOR")
}

else if (txtdata == "PRO")
{
	if (global.pro == 1) or ( global.user_id == 958056345 or global.user_id == 1966891044 )
	{
	with (o_rm2_btn) {active = false}
	active = true
	
	global.nftpage = 1
	global.mytank = 1
	global.tactive= "PRO"
	instance_deactivate_layer("NFTs")
	instance_deactivate_layer("TANKS")
	
	instance_activate_layer("PRO")
	instance_activate_layer("BTN_TCOLOR")
	}
}

else if ( (txtdata == "NFTs") and ( global.user_id == 958056345 or global.user_id == 1966891044 ) )
{
	with (o_rm2_btn) {active = false}
	active = true
	
	global.tank_color = c_white; 
	global.nftpage = 1
	global.mytank = 1
	global.tactive= "NFTs"
	instance_deactivate_layer("PRO")
	instance_deactivate_layer("TANKS")
	instance_deactivate_layer("BTN_TCOLOR")
	
	instance_activate_layer("NFTs")
}
