/// @description Insert description here
// You can write your code in this editor
image_index=0;
image_speed=0;

hp = 2;

gotDamageFrom = 0;

show_message("CREB")

global.briksId++
bid = real(global.briksId);
global.briks[real(global.briksId)] = []; // здесь будут храниться все созданные блоки кирпича

array_push(global.briks[real(global.briksId)], id,hp); // (добавить) вставить в конец

instance_deactivate_object(self)

