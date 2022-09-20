
//show_message(array_get(global.briks[1], 1));
//От сервера


for (var i = 0; i < array_length(global.briks); i += 1)
{
	srid = real(array_get(global.briks[i], 3))
	if (srid == 111000)
	{
	array_set(global.briks[i],1,1) // HP
	array_set(global.briks[i],2,irandom_range(1,4)); // Сторона попадания 1 - 4
	}
}