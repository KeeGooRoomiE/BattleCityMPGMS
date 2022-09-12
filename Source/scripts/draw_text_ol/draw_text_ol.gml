function draw_text_ol(argument0, argument1, argument2, argument3, argument4) {
	//0-x, 1-y, 2-текст, 3-цвет текста, 4-цвет обводки
	var _current_color, _current_alpha;
	_current_color=draw_get_color() //записывает текущие значения
	_current_alpha=draw_get_alpha()
	//draw_set_color(argument4) //обводка
	draw_text(argument0-1,argument1,string_hash_to_newline(argument2))
	draw_text(argument0+1,argument1,string_hash_to_newline(argument2))
	draw_text(argument0,argument1-1,string_hash_to_newline(argument2))
	draw_text(argument0,argument1+1,string_hash_to_newline(argument2))
	draw_set_color(argument3) //сам текст
	draw_text(argument0,argument1,string_hash_to_newline(argument2))
	draw_set_color(_current_color) //возвращаем назад значения альфы и цвета
	draw_set_alpha(_current_alpha)



}
