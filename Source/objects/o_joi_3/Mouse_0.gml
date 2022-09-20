/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе
/*
var xinput = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var yinput = keyboard_check(ord("S")) - keyboard_check(ord("W"));
*/




    /*
// No diagonal movement
if (xinput != 0)
{
    yinput = 0;    
}

x += xinput * move_speed
y += yinput * move_speed;
*/
if (place_meeting(x, y, o_pesok))
{
move_speed = 4;
}else {move_speed = 6.3;}



with (ObjPlayer)
{
direction = 180
image_angle = direction
x -= 1 * move_speed;
    while (place_meeting(x, y, o_wall))
    {
        x++;
    }      
}