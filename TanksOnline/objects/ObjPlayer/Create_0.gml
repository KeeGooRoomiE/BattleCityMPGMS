global.fli = 0
canMoveDpad = 0;
move_speed = 3;

cell_width = 40;
cell_height = 40;
x_dest = x;
y_dest = y;
image_xscale=0.5
image_yscale=0.5
instance_create( x, y, obj_spawner);
instance_create(x,y,obj_map)
audio_play_sound(m_start, 10, false);
//instance_create_layer(x,y,"DULO",o_dulo)

image_speed=0
can_shoote=1
bb4=0 // +25% speed щяс 0
//bb7=0 // -10% speed щяс 0

//instance_create(x,y,obj_button_exit)
instance_create_layer(x,y,"TXT_PL",obj_draw_text_tank)

