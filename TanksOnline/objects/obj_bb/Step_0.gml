bb = array_get(global.bonbon[bid], 2)

active = array_get(global.bonbon[bid], 4)
if (active)
{
sprite_index = Death_antibooster
}else
{
	sprite_index = sprite_bonbon_no_wall
}