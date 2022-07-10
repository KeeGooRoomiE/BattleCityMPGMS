function gmcallback_sio_on_fserv_bullet_destroy() {

	var data = json_decode(argument[0]);
	if instance_exists(o_bullet_en)
	{
		with(o_bullet_en){
			if(real(ibullet) == real(data[? "ibullet"])){
				instance_destroy();
			}
		}
	}
	
	if instance_exists(o_bullet)
	{
		with(o_bullet){
			if(real(ibullet) == real(data[? "ibullet"])){
				instance_destroy();
			}
		}
	}
}