function sio_emit_datax_update() {
	var eventName = "datax_update";
	var imageangles = global.gms_imageangle
	
#region packet
		var data = ds_map_create();
			data[? "imageangle"] = real(imageangles);
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion
}
