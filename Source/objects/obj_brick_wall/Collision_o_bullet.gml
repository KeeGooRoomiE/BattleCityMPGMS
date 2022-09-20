<<<<<<< HEAD

	if (hp = 2)
	{
		igotDamageFrom = other.damageSide;
		sio_emit_block_hp_mm(string(bindex),1,string(igotDamageFrom)); 
		
		gotDamageFrom = array_get(global.briks[bid], 4)
		image_index=gotDamageFrom;
	}else{
		sio_emit_block_hp_mm(string(bindex),1,0); 
	}
=======
/// @description Insert description here
// You can write your code in this editor

gotDamageFrom = other.damageSide;
hp -= 1;

array_set(global.briks[bid],1,hp); 
>>>>>>> parent of 120574d (-)
