canMoveDpad = 0;
move_speed = 3; // было 3 

cell_width = 32; //было 40 
cell_height = 32; //было 40 
x_dest = x;
y_dest = y;
instance_create(x,y,obj_map)
instance_create(x,y,o_vol_2)
instance_create(x,y,o_money_2)
//audio_play_sound(m_start, 10, false);
image_index=global.mytank;
sprite_index = global.st_index;
image_blend = global.tank_color;

depth=-2
can_shoote=1
//image_blend=choose(c_lime,c_silver,c_yellow,c_white);

direction = 90
image_angle = direction
image_speed=0
//global.fli = 0
//instance_create_depth(x,y,-111111,o_duloOFF)

//alarm[0]=2

//camera_set_view_size(view_camera[0],room_width,room_height);