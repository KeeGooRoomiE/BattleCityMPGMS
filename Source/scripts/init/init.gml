function init() {
	//Dpad
	//global.dir=90                           //Dpad Direction
	global.length=0                         //Dpad Length
	global.padEnable = false;
	global.cx = 0;
	global.cy = 0;
	
	global.briks[0] = []; // здесь будут храниться все созданные блоки 
	array_push(global.briks[0], 0, 1, 2, 3, 4);
	global.briksId = 0; // уникальный идентификатор для каждого блока 
	
	global.bonbon[0] = []; // здесь будут храниться все созданные блоки бонуса
	array_push(global.bonbon[0], 0, 1, 2, 3, 4, 5);
	global.bonbonId = 0; // уникальный идентификатор для каждого блока Бонуса
	
	global.bbtimer = 0; // кадр таймера бонуса
	global.bbtimermax = 8; // колличество кадров таймера бонуса
	global.volume = 0; // громкость 
	audio_master_gain(0)
	global.p_online=0 // онлайн игроков
	global.bb=0 // какой номер бонуса действует на игрока
	global.hp=3
	global.lang=1 // 1 - russ, 0 - en
	global.i_a=0 // Прозрачность
	global.mytank = 1 //какой кадр танка выбран (image_index)
	global.nftpage = 1
	global.tactive= "TANKS" // какой щяс задана категория выбора танка
	global.st_index = "NFT_Oth_Tank" // какой индекс спрайта танка выбран (sprite_index)
	global.tank_color = c_white; 
	global.pro = 1; //  pro 1/0
	
	global.user_id = "$user_id"; //  id MP
	global.roomid = "$room_id"; // Battle id MP
	global.battle_id = "$battle_id"; //  id MP
	
	global.username = "username007"; 
	global.amount = "10.00000000";
	global.wallet = "1" // 1 - usdt - 2 - mind

	
	room_goto(rm2_start)
	//game_set_speed(60, gamespeed_fps);
}

