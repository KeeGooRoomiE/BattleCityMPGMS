
image_index = array_get(global.briks[bid], 4)
hp = array_get(global.briks[bid], 2)
x = array_get(global.briks[bid], 0)
y = array_get(global.briks[bid], 1)

if (hp < 1)
{
	sprite_index=sprite_bonbon_no_wall;
}else{sprite_index=spr_brick_wall;}

