wview = browser_width;
hview = browser_height;

// IF LOCAL TEST - TODO if OFFLINE - не обязательно 
sio_emit_if_i_online(); //проверка если был совершен реконнект (в игре ли числиться игрок)
sio_emit_do_me_info(); //info_user 
global.mytank=1
global.nftpage=1
global.tank_color = c_white //for local test
	instance_deactivate_layer("PRO")
	instance_deactivate_layer("NFTs")
	//instance_deactivate_layer("BTN_TCOLOR")
	
	instance_activate_layer("TANKS")
