sprite_index = sprite_bonbon_no_wall
global.bb=bb;
with (obj_draw_text_tank){bbtimertrue=0}
global.bbtimer=0

audio_play_sound(bonus_appear,10,false)
switch (bb)
{
    case 9:
        sio_emit_hp_one();
    break;
	case 8:
        with (ObjPlayer){alarm[3]=30*30};
    break;
    case 7:
        with (ObjPlayer){alarm[3]=30*30};
    break;
    case 6: //Ghost
        with (ObjPlayer){alarm[3]=30*15};
			global.bbtimermax=30*15
    break;
    case 5: // + hil
	sio_emit_hp_update();
	with (ObjPlayer){alarm[3]=45};
			global.bbtimermax=45
    break;
    case 4: // tank speed
        with (ObjPlayer){alarm[3]=30*30};
			global.bbtimermax=30*30
    break;
    case 3: // Zhot speed
        with (ObjPlayer){alarm[3]=30*30};
			global.bbtimermax=30*30
    break;
    case 2: //water
        with (ObjPlayer){alarm[3]=30*30};
			global.bbtimermax=30*30
    break;
    case 1: //bullet wall2
        with (ObjPlayer){alarm[3]=30*60};
			global.bbtimermax=30*60
			
    break;
}
sio_emit_bb_destroy(string(bbindex),string(bb));
audio_play_sound(bonus_appear, 10, false);
instance_destroy()
