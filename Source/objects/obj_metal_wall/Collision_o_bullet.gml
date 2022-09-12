if (global.bb==1)
{
	if (hp = 2)
	{
		igotDamageFrom = other.damageSide;
		sio_emit_block_hp_mm(string(bindex),1,string(igotDamageFrom)); 
		
		gotDamageFrom = array_get(global.briks[bid], 4)
		image_index=gotDamageFrom;
	}else{
		sio_emit_block_hp_mm(string(bindex),1,0); 
	}
}