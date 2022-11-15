
global.fli = 0
canMoveDpad = 0;
move_speed = 1; // было 3 =(0.6= *3-80%*)

cell_width = 32; //было 40 =(8= *40-80%*)
cell_height = 32; //было 40 =(8= *40-80%*)
x_dest = x;
y_dest = y;
instance_create_depth( x, y,600, obj_spawner);
instance_create_depth(x,y,1200,obj_map)
audio_play_sound(m_start, 10, false);
//instance_create_layer(x,y,"DULO",o_dulo)

image_speed=0
can_shoote=1
bb4=0 // +25% speed щяс 0
//bb7=0 // -10% speed щяс 0
sprsh=0
//instance_create_depth(x,y,1,obj_button_exit)
instance_create_layer(x,y,"TXT_PL",obj_draw_text_tank)
alarm[0]=2

