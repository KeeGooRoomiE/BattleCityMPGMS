// Ресурсы скриптов были изменены для версии 2.3.0, подробности см. по адресу
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function minimap_off(argument0,argument1,argument2){
var _x, _y, _s;
_x = argument0;
_y = argument1;
_s = argument2;

draw_sprite(spr_radar_0,1,_x+130,_y)

draw_rectangle_color(_x,_y,_x+room_width/_s,_y+room_height/_s,c_yellow,c_yellow,c_yellow,c_yellow,1); 
draw_set_font(fnt_minimap)
//draw_text(_x+130,_y+10,"ONLINE PLAYERS:"+string(global.p_online)); 






//Draws the minimap
/*
with (obj_spawner)
{
draw_set_color(c_yellow);
//Color of the object on the minimap
draw_rectangle(_x+x/_s-sprite_width/(2*_s),_y+y/_s-sprite_height/(2*_s),_x+x/_s+sprite_width/(2*_s),_y+y/_s+sprite_height/(2*_s),0);
//_s means size. Do not edit out sprite_width and sprite_height!

sprite_collision_mask(-1,true,0,-1,-1,-1,-1,0,0); 
//This will make your objects dragable so you won't need to alt + click the objects one by one

//This gives the minimap a fog

        draw_set_alpha(1);

 
}
*/
//This could be an item on the minimap
with (o_kirpich)
{
draw_set_color(c_red);
draw_rectangle(_x+x/_s-sprite_width/(2*_s),_y+y/_s-sprite_width/(2*_s),_x+x/_s+sprite_width/(2*_s),_y+y/_s+sprite_width/(2*_s),0);
}

with (obj_spawner)
{
draw_set_color(c_white);
draw_rectangle(_x+x/_s-sprite_width/(2*_s),_y+y/_s-sprite_width/(2*_s),_x+x/_s+sprite_width/(2*_s),_y+y/_s+sprite_width/(2*_s),0);
}

//This is the player
with (OFF_ObjPlayer)
{
//draw_set_alpha(1);
draw_set_color(c_green);
draw_rectangle(_x+x/_s-sprite_width/(1.1*_s),_y+y/_s-sprite_width/(1.1*_s),_x+x/_s+sprite_width/(1.1*_s),_y+y/_s+sprite_width/(1.1*_s),0);
//draw_circle(_x+x/_s-sprite_width/(2*_s),_y+y/_s-sprite_width/(2*_s),4,0);
}
}