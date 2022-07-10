function gmcallback_sio_on_do_gotoroom() {
	var data = json_decode(argument[0]);
	global.username = data[? "username"];
	global.amount = data[? "amount"];
	global.wallet = data[? "wallet"];
	room_goto(rm3_game)
	//show_message("ON room1_init gotoroom 2") // TODO IF VLACk WINDOW TO FIX
}