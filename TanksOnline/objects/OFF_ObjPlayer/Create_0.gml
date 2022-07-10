instance_create(x,y,obj_map)
//audio_play_sound(m_start, 10, false);
image_index=global.mytank;
sprite_index = global.st_index;
image_blend = global.tank_color;
image_xscale=0.5
image_yscale=0.5
depth=-2
can_shoote=1
//image_blend=choose(c_lime,c_silver,c_yellow,c_white);

direction = 90
image_angle = direction
image_speed=0
//global.fli = 0
canMoveDpad = 0;
move_speed = 8;

cell_width = 80;
cell_height = 80;
x_dest = x;
y_dest = y;

//instance_create_depth(x,y,-111111,o_duloOFF)

//alarm[0]=2