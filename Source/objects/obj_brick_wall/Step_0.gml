 gotDamageFrom = array_get(global.briks[bid], 2)
hp = array_get(global.briks[bid], 1)

if (hp = 1)
{
	image_index=gotDamageFrom;
}
if (hp < 1)
{
	instance_destroy(id);
}

