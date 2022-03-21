function gmcallback_sio_on_send_bullet() {
	var data = json_decode(argument[0]);
	
	var bb = instance_create_depth(data[? "x"], data[? "y"], -2,o_bullet_en);
		
		bb.speed = data[? "speed"];
		bb.damage = data[? "damage"];
		bb.direction = data[? "direction"];
	
}
