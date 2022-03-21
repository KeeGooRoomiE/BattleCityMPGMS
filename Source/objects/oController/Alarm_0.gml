/// request for ping every 10 seconds
alarm[0] = room_speed * 10;
sio_emit("ping", "");

/// Get the current connection status
var connectionStatus;

if(!sio_get_connection_status()){
	window_set_caption("NOT connected!!")
}
else {
	window_set_caption("connected server!")
}

