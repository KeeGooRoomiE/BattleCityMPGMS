function sio_emit_create_bullet() {
	var eventName = "create_bullet";
	var thp = 1;
	var imageangles = global.gms_imageangle
	
#region packet
		var data = ds_map_create();
			data[? "hp"] = real(thp);
			data[? "imageangle"] = real(imageangles);
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion
}
