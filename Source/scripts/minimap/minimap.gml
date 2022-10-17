
function minimap(argument0,argument1,argument2){
var _x, _y, _s;
_x = argument0;
_y = argument1;
_s = argument2;

if (wview >1090)
{//PC
	draw_sprite(spr_radar_0,1,_x+128,_y)
}else{//SMART
	draw_sprite(spr_radar_1,1,_x+148,_y)
}


draw_rectangle_color(_x,_y,_x+room_width/_s,_y+room_height/_s,c_white,c_white,c_white,c_white,1); 
draw_set_font(fnt_minimap)

draw_set_color(c_white); 
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_font(fnt_minimap2)

if (wview >1090)
{
	draw_sprite(spr_asset_7, image_index, _x+150,_y+260);
	draw_text(_x+150+10,_y+260+8,"Online: "+string(global.p_online)); 
}else{
	draw_sprite(spr_asset_7, image_index, _x,_y+148);
	draw_text(_x+10,_y+148+8,"Online: "+string(global.p_online)); 
}






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
with (Obj_other_Player)
{
draw_set_color(c_red);
draw_rectangle(_x+x/_s-sprite_width/(1.8*_s),_y+y/_s-sprite_width/(1.8*_s),_x+x/_s+sprite_width/(1.8*_s),_y+y/_s+sprite_width/(1.8*_s),0);
}

with (obj_spawner)
{
draw_set_color(c_white);
draw_rectangle(_x+x/_s-sprite_width/(1.1*_s),_y+y/_s-sprite_width/(1.1*_s),_x+x/_s+sprite_width/(1.1*_s),_y+y/_s+sprite_width/(1.1*_s),0);
}

//This is the player
with (ObjPlayer)
{
//draw_set_alpha(1);
draw_set_color(c_green);
draw_rectangle(_x+x/_s-sprite_width/(1.1*_s),_y+y/_s-sprite_width/(1.1*_s),_x+x/_s+sprite_width/(1.1*_s),_y+y/_s+sprite_width/(1.1*_s),0);
//draw_circle(_x+x/_s-sprite_width/(2*_s),_y+y/_s-sprite_width/(2*_s),4,0);
}
}