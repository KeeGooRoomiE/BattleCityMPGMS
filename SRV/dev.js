const express = require('express');
const app = express();
const server = require('http').createServer(app);
const io = require('socket.io')(server, { cors: { origin: '*' } });

const port = 5000;
const mysql = require("mysql2");

app.use(express.static("../"));

const game_id = 287981;
var timestamp = Number(Math.round(Date.now()/(1000))); //Number(new Date());
var secret = "0rfdYoyFQmYKIU8cF0b1R9hIwfKx86";

var players = [];  // здесь будут храниться все подключенные игроки
var clientId = 0; // уникальный идентификатор для каждого клиента

var blocks = []; // здесь будут храниться все созданные блоки
var blocksId = 0; // уникальный идентификатор для каждого блока

var bblocks = []; // здесь будут храниться все созданные бонсы
var bblocksId = 0; // уникальный идентификатор для каждого бонса

var datax = []; // здесь будут храниться все убитые противники...

var bullets = []; // здесь будут храниться все созданные пули
var bulletId = 0; // уникальный идентификатор для каждой пули


  global.sqhost = "localhost";
  global.squser = "rp2mm6yi0f";
  global.sqdatabase = "tsdrtyrtyd65dutyikf";
  global.sqpassword = "zA3nX9gX2n";


// Чтение конерктных данных
const sqlconnectionv = mysql.createConnection({
  host: sqhost,
  user: squser,
  database: sqdatabase,
  password: sqpassword
});
const sqlrd = "SELECT * FROM tanks";
sqlconnectionv.query(sqlrd,  function(err, results) {
    if(err) console.log(err);
    const tanks = results;

    for(let i=0; i < tanks.length; i++){
      //console.log(tanks[i].username);
	  
	  console.log(`Игрок ${tanks[i].username}  [${tanks[i].id}] добавлен из БД`);
		player = new Player({
		user_id: tanks[i].user_id, // BD MINDPLAY
		username: tanks[i].username, // BD server
		room: tanks[i].room,
		battle: tanks[i].battle,
		amount: tanks[i].amount,
		start_timestamp: tanks[i].start_timestamp,
		isonline: 0, 
		id: tanks[i].id,
		x: tanks[i].x,
		y: tanks[i].y,
		imageindex: tanks[i].imageindex,
		tankcolor: tanks[i].tankcolor,
		spriteindex: tanks[i].spriteindex,
		hp: tanks[i].hp
        });
		// присваиваем id игрока каждой переменной массива,чтобы вносить
		// убитых соперников в индивидуальном порядке

		datax[player.user_id] = [];
		players.push(player);
		player.isonline = 0
		setTimeout(kickPlsql, 300,player);
    }
});

// Чтение 
const sql2 = `SELECT * FROM tanks_array`;
sqlconnectionv.query(sql2, function(err, results) {
    if(err) console.log(err);
    const tanks_array = results;
	for(let i=0; i < tanks_array.length; i++){
		console.log(`Array игрока ${tanks_array[i].datax} добавлен из БД`);
		datax[tanks_array[i].datax].push( // дополняем игроку-победителю выйгрышный тип данных в массив (A)
				{
					operation_type: tanks_array[i].operation_type,
					amount: tanks_array[i].amount,
					opponent_id: tanks_array[i].opponent_id,
					comment: tanks_array[i].comment,
					battle_id: tanks_array[i].battle_id,
				},
			);
        };
});
// Ч

sqlconnectionv.end();
// Ч к д




///////////////////////// * SF * ////////////////////////
function kickPlsql(player) {
console.log(`Проверка игрока [${player.username}] на активность`);
		
	var isfoundst = false;

	  for (i = 0; i < players.length; i++)
	  {
		  if (players[i].user_id == player.user_id && players[i].room == player.room)
		  {
		  isfoundst = true;
		  break;
		  }
	  }
	  if (!isfoundst)
			{
			console.log(`Игрок ${player.username} НЕ найден на сервере УДАЛЕЕН!--`);
			// ничего не делаем так как он уже был убит, либо завершил игру (game_result) и кикнут сервером
			}else{
			console.log(`Игрок ${player.username} найден на сервере ЖИВОЙ!++`);
		
				if (players[i].isonline == 0) // Если игрок не успел вернуться за тайминг то удаляем игрока из памяти 
				{
					console.log(`Игрок [${players[i].username}] игрок НЕ успел вернуться за тайминг---`);
					
					//и если у него есть убитыве противники в массиве то отправляем данные в MP
					if (datax[players[i].user_id].length>0)
					{
						console.log(`Игрок [${players[i].username}] имеет убитых игроков - отправляем в MP`);
						var ram = Number((Number(players[i].amount)*Number(datax[players[i].user_id].length))+Number(players[i].amount));
						////////////////////// *** POST *** //////////////////////
						var crypto = require('crypto');
						var domd5 = game_id+":"+players[i].user_id+":"+players[i].room+":"+players[i].battle+":"+timestamp+":"+secret;
						var hash3 = crypto.createHash('md5').update(domd5).digest('hex'); 

						const https = require('https')

						const data = JSON.stringify({
						  game_id: game_id,
						  user_id: players[i].user_id,
						  room_id: players[i].room,
						  battle_id: players[i].battle,
						  timestamp: timestamp,
						  hash: hash3,
						  result_amount: ram,
						  start_timestamp:  Number(players[i].start_timestamp),
						  finish_timestamp: Number(Math.round(Date.now()/(1000))), 
						  data: datax[players[i].user_id],
						})

						const options = {
						  hostname: 'mindplays.com',
						  port: 443,
						  path: '/api/v1/multiplayer/result_game',
						  method: 'POST',
						  headers: {
							'Content-Type': 'application/json',
							'Content-Length': data.length
						  }
						}

						const req = https.request(options, res => {
						  console.log(`statusCode: ${res.statusCode}`)

						  res.on('data', d => {
							process.stdout.write(d)
						  })
						})

						req.on('error', error => {
						  console.error(error)
						})

						req.write(data)
						req.end()
						////////////////////// *** POST *** //////////////////////
						

					
					// Делеес
					const sqlconnectiondel = mysql.createConnection({
					  host: sqhost,
					  user: squser,
					  database: sqdatabase,
					  password: sqpassword
					});

					const sqlxx = "DELETE FROM tanks_array WHERE datax=?";
					const dataxx = [players[i].user_id]; 
					sqlconnectiondel.query(sqlxx, dataxx, function(err, results) {
						if(err) console.log(err);
						//console.log(results);
					});
					sqlconnectiondel.end();
					//Дел		
					
						datax[players[i].user_id] = [];	// очищаем					
					}else{	
					console.log(`Игрок [${players[i].username}] НЕ ИМЕЕТ убитых противников`);					
					if (typeof(players[i]) !== 'undefined')
						{
							var crypto = require('crypto');
							var domd5 = game_id+":"+players[i].user_id+":"+players[i].room+":"+players[i].battle+":"+timestamp+":"+secret;
							var hash3 = crypto.createHash('md5').update(domd5).digest('hex'); 
							const https = require('https')

							const data = JSON.stringify({
							  game_id: game_id,
							  user_id: players[i].user_id,
							  room_id: players[i].room,
							  battle_id: players[i].battle,
							  timestamp: timestamp,
							  comment: "pl_disconnected",
							  hash: hash3,
							})

							const options = {
							  hostname: 'mindplays.com',
							  port: 443,
							  path: '/api/v1/multiplayer/close_game',
							  method: 'POST',
							  headers: {
								'Content-Type': 'application/json',
								'Content-Length': data.length
							  }
							}

							const req = https.request(options, res => {
							  console.log(`statusCode: ${res.statusCode}`)

							  res.on('data', d => {
								process.stdout.write(d)
							  })
							})

							req.on('error', error => {
							  console.error(error)
							})

							req.write(data)
							req.end()
							
						};
					}
					
					
						// Делеес
						const sqlconnection = mysql.createConnection({
						  host: sqhost,
						  user: squser,
						  database: sqdatabase,
						  password: sqpassword
						});

						const sql = "DELETE FROM tanks WHERE user_id=? AND room=?";
						const data = [players[i].user_id, players[i].room];
						sqlconnection.query(sql, data, function(err, results) {
							if(err) console.log(err);
							console.log("SQL:: Пользователь удален");
						});
						sqlconnection.end();
						// Дел
			
						//удаляем игрока из списка	
						console.log(`Игрок ${players[i].username} Кикнут таймингом`);
						//client.broadcast.emit('destroy_player', players[i].toString());
						players.splice(players.indexOf(players[i]), 1);
				}else{
					console.log(`Игрок [${players[i].username}] игрок УСПЕЛ вернуться за тайминг+++`);
				}
			}
}
///////////////////////////// * FF * /////////////////////////////

// Слушаем входящие соединения
server.listen(port, (err) => {
    if (err) throw err
    console.log(`Сервер ?? на порту ${port}`);


	///calбэк//
	const urlencodedParser = express.urlencoded({extended: false});
	app.post("/api/v1/check_user", urlencodedParser, function (request, response) {
		//if(!request.body) return response.sendStatus(400);
		var urs = Number(request.body.user_id);
		//request.body.game_id
		var rmid = Number(request.body.room_id);
		var btl = Number(request.body.battle_id);
		//request.body.timestamp
		
		
		var cbtrue=false;
		
        for (let i in players) 
			{
				if ( (players[i].user_id == urs) &&  (players[i].room == rmid) &&  (players[i].battle == btl)/* &&  (timestamp == request.body.timestamp)*/ )
				{
					cbtrue=true;
					break;
				}
			}
			if (cbtrue)
				{
						var crypto = require('crypto');
						var domd5 = game_id+":"+players[i].user_id+":"+players[i].room+":"+players[i].battle+":"+timestamp+":"+secret;
						var hash3 = crypto.createHash('md5').update(domd5).digest('hex'); 

						const datacu = JSON.stringify({
						  user_id: players[i].user_id,
						  game_id: String(game_id),
						  room_id: players[i].room,
						  battle_id: players[i].battle,
						  timestamp:  String(timestamp),
						  result_amount: /*ram, */null,
						  start_timestamp:  String(players[i].start_timestamp),
						  finish_timestamp: /*Number(Math.round(Date.now()/(1000))),*/ null,
						  hash: hash3,
						  data: /*datax[players[i].user_id],*/ null,
						})
						
					response.send(`${datacu}`);
					console.log(datacu);
				}
				else{	
						const datacu = JSON.stringify({
						  status: 400,
						  error: {
							  message: "Game played not found"
						  },
						})
						
					console.log(datacu);
					response.send(`${datacu}`);
				}
		
	});
	///calбэк//
	/*
	///URL TEST//
	const urlencodedParser2 = express.urlencoded({extended: false});
	app.get("/code2", urlencodedParser2, function (request, response) {
		
	console.log(`code2 ok`);
		
	});
	///URL TEST//
	*/
});


///////////////////////////// * START CLASS * /////////////////////////////
class Player {
    constructor(data) {
		this.user_id = data.user_id; // МP data
        this.username = data.username; // МP data
        this.room = data.room; // МP data
        this.battle = data.battle; // МP data
        this.amount = data.amount; // МP data
        this.start_timestamp = data.start_timestamp;
        this.socket = data.socket;
        this.isonline = data.isonline; // живой ли игрок (числиться ли на сервере)
        this.id = data.id; // id на сервере
		this.direction = data.direction;  // направление
        this.x = data.x;
        this.y = data.y;
        this.imageindex = data.imageindex; // тип танка (кадр)
        this.tankcolor = data.tankcolor;  // цвет танка
        this.spriteindex = data.spriteindex; // тип танка (картинка)
        this.hp = data.hp;
        this.imageangle = data.imageangle;  // куда смотрит танк (туда и поовернут через direction)
        this.bb = data.bb; // Дейстующий бонус на игрока
		this.image_alpha = data.image_alpha;  // прозрачность (задаеться при бонусе неуязвиомсть)
    }

    toString() {
        return JSON.stringify(this, this.replacer);
    }

    replacer(key, value) {
        // нам не нужно отправлять объект сокета клиенту
        if (key == "socket") return undefined;
        else return value;
    }
}
class Bullet {
	constructor(ibullet,x,y,speed,damage,direction,room) {
		this.ibullet = ibullet;
        this.x = x;
        this.y = y;
		this.speed = speed;
        this.damage = damage;
        this.direction = direction;
        this.room = room;
    }
	toString() {
        return JSON.stringify(this);
    }
}

class Block {
	constructor(x,y,blayer,obb,hp,bindex,room,gotDamageFrom) {
        this.x = x;
        this.y = y;
        this.blayer = blayer;
        this.obb = obb;
        this.hp = hp;
        this.bindex = bindex;
		this.room = room;
		this.gotDamageFrom = gotDamageFrom;
    }
	toString() {
        return JSON.stringify(this);
    }
}

class Bblock {
	constructor(x,y,bb,blayer,room,bbindex,act) {
        this.x = x;
        this.y = y;
        this.bb = bb;
        this.blayer = blayer;
		this.room = room;
        this.bbindex = bbindex;
        this.act = act;
    }
	toString() {
        return JSON.stringify(this);
    }
}

class Clientx {
	constructor(data) {
        this.amount = data.amount;
        this.username = data.username;
		this.wallet = data.wallet;
    }
	toString() {
        return JSON.stringify(this);
    }
}

class Clientxqqw {
	constructor(data) {
        this.pro = data.pro;
    }
	toString() {
        return JSON.stringify(this);
    }
}

class Clientrc {
	constructor(data) {
        this.ifrec = data.ifrec;
    }
	toString() {
        return JSON.stringify(this);
    }
}

class GenDataQw {
	constructor(data) {
        this.room_id = data.room_id;
        this.qw = data.qw;
    }
	toString() {
        return JSON.stringify(this);
    }
}
					

class xdata_ou {
	constructor(data) {
        this.plrmle = data.plrmle;
    }
	toString() {
        return JSON.stringify(this);
    }
}

class xdata_coin {
	constructor(data) {
        this.plam = data.plam;
    }
	toString() {
        return JSON.stringify(this);
    }
}

class xdata_vol {
	constructor(data) {
        this.vol = data.vol;
    }
	toString() {
        return JSON.stringify(this);
    }
}

class plp {
	constructor(data) {
        this.plpong = data.plpong;
    }
	toString() {
        return JSON.stringify(this);
    }
}
///////////////////////////// * END CLASS * /////////////////////////////



io.on('connection', (client) => {
console.log('Клиет постучался');


var block;
var player;
var clientx;
var gendataqw;
////// REgen//// // TODO
function reGen(room_id) {

			console.log(`Запущен процесс регенереции...`);
			for (let i in blocks) 
				{
					if ( (blocks[i].hp < 1) && (blocks[i].room == room_id) && ( (blocks[i].blayer == "WALL") || (blocks[i].blayer == "BRICK") ) )
					{
					blocks[i].hp = 2 ;
					blocks[i].gotDamageFrom = 0; 
					//client.emit('gms_block_hp_update', blocks[i].toString());
					client.broadcast.emit('gms_block_hp_update', blocks[i].toString());	
					client.broadcast.emit('gms_block_hp_update', blocks[i].toString());	
					}
				}
				for (let i in bblocks) 
				{
					if ( (bblocks[i].act == 0) && (bblocks[i].room == room_id) )
					{
					bblocks[i].act = 1;
					//client.emit('send_bb_act_update', bblocks[i].toString());
					client.broadcast.emit('send_bb_act_update', bblocks[i].toString());	 //TODO
					client.broadcast.emit('send_bb_act_update', bblocks[i].toString());	
					client.broadcast.emit('send_bb_act_update', bblocks[i].toString());	
					}
				}
}
//////////////////////// * Re-GeN * //////////////////////
///  * G E N * ///




client.on('can_i_gen', (data) =>
{
	data = JSON.parse(data);
	rid = data.room_id
	//console.log(`GEN QWERY: [${rid}].... `);
	////////////
	var isfoundbl = false;
	if (blocks.length>0) // Если есть блоки на сервере
	{
		//let fs = require('fs');
		//fs.unlinkSync("map.txt") // DEBUG MAP
		
		
		//console.log(`GEN FIRST: NO`);
		  for (i = 0; i < blocks.length; i++)
		  {
			  if (blocks[i].room == rid)
			  {
			  isfoundbl = true;
			  break;
			  }
		  }
		  if (!isfoundbl)
				{
					//console.log(`GEN QWERY: NO-isfoundbl---`);
					var gendataqw = new GenDataQw({
					room_id: rid,
					qw: 1
					});
					client.emit('block_gen', gendataqw.toString());
				}else{
					//console.log(`GEN QWERY: YES+isfoundbl+++`);
					var gendataqw = new GenDataQw({
					room_id: rid,
					qw: 0
					});
					client.emit('block_gen', gendataqw.toString());
					
					// Получение с сервера всех блоков для себя раз их не надо генить
					for (let i in blocks) 
						{ 
						if (blocks[i].room == rid && blocks[i].hp > 0)
							{ 
								client.emit('send_block', blocks[i].toString()); 
								//fs.appendFileSync("map.txt","\n"+`${blocks[i]}`); // DEBUG MAP
								//console.log(`Получен block`);
							}
						}
					
					// Получение с сервера всех Бонус блоков для себя раз их не надо генить
					for (let i in bblocks) 
						{ 
						if (bblocks[i].room == rid)
							{ 
								client.emit('send_bb', bblocks[i].toString()); 
								//console.log(`Получен bblockID {$bblocks[i].bbindex}`);
							}
						}
				}
	}else{ //вообще нет блоков на сервере? создаем + ответ на генерацию блоков
		//console.log(`GEN FIRST: YES`);
		var gendataqw = new GenDataQw({
		room_id: rid,
		qw: 1
		});
		client.emit('block_gen', gendataqw.toString());
	}
});

client.on('do_me_update', (data) =>
{
data = JSON.parse(data);

	console.log(`do_me_update от игрока [${player.username}] `);
	if (player.isonline == 1)
		{
		console.log(`Проверка игрока [${player.username}] на активность == ${player.isonline}`);
		for (let i in blocks)
			{
			if (blocks[i].room == player.room)
				{
				client.emit('block_regen', blocks[i].toString());
				}
			}
		}
});
//////////////////////// * Re-GeN * //////////////////////

////* ЧЕК ЮЗЕР *//////////////////////////////////////////
client.on('do_me_info', (data) =>
{
	data = JSON.parse(data);
	var iuser_id = Number(data.user_id); // прислать с клиента user_id
	var iroom = Number(data.room); // прислать с клиента user_id
	console.log(`do_me_info :: info_user init :: ${iuser_id}`);

/// SQL check and send2cl VOL
// sql find
		
		const sqlconnectionifindsett = mysql.createConnection({
		host: sqhost,
		user: squser,
		database: sqdatabase,
		password: sqpassword
		});
							
		const sqlf2 = `SELECT * FROM player_settings WHERE userid=?`;
		const fdatas = [iuser_id];
		sqlconnectionifindsett.query(sqlf2, fdatas, function(err, results) {
		if(err)
		{
			console.log(err);
		}
			//console.log(results);
		
		if (results.length !== 0) 
		{
			//отправляем клиенту статус звука
			
			var xdatavol = new xdata_vol({
				vol: results[0].vol
			});
			client.emit('gvol', xdatavol.toString());
			
		
		}
	});
	sqlconnectionifindsett.end();


/// SQL check and send2cl VOL

///////// REGENDO?
	var bcount=0; // Всего блоков в заданной комнате
	var hpzbcount=0; // Всего уничтоженных блоков в заданной комнате

for (let i in blocks) {

	if (blocks[i].hp == 0 && blocks[i].room == data.room && ( blocks[i].blayer == "BRICK" || blocks[i].blayer == "WALL" )){hpzbcount++}
	if (blocks[i].room == data.room && ( (blocks[i].blayer == "WALL") || (blocks[i].blayer == "BRICK") ) ){bcount++}
}
	var mkrg = Number(bcount)*0.25	; // при каком колличестве регенить карту, при -25%
	
	console.log(`bcount TOTAL: ${bcount}`);
	console.log(`hpzbcount DESTROYED: ${hpzbcount} / ${mkrg}`);
	if ( (Number(hpzbcount) > Number(mkrg)) && Number(bcount) > 0)
	{
		console.log(`Инициирован протокол регенерации...`);
		setTimeout(reGen, 10, data.room);
	}else
	{
		console.log(`Регенерация не требуеться`);
	}
///////// REGENDO?


////////////////////// *** POST *** ////////////////////// 
					
					var crypto = require('crypto');
					var domd5 = game_id+":"+iuser_id+":"+timestamp+":"+secret;
					var hash3 = crypto.createHash('md5').update(domd5).digest('hex'); 

					const https = require('https')
					

					

					const dataxjq = JSON.stringify({
						  game_id: game_id,
						  user_id: iuser_id,
						  room_id: iroom,
						  timestamp: timestamp,
						  hash: hash3,
					})
					
					const options = {
					  hostname: 'mindplays.com',
					  port: 443,
					  path: '/api/v1/multiplayer/info_user',
					  method: 'POST',
					  headers: {
						'Content-Type': 'application/json',
						'Content-Length': dataxjq.length
					  }
					}

					const req = https.request(options, res => {
					  //console.log(`statusCode: ${res.statusCode}`)

					  res.on('data', d => {
					//process.stdout.write(d)
					var dataxjqx = JSON.parse(d);
					//console.log(d);
////////////////////
					var aa = dataxjqx["data"];
					var bb = aa["user"];
					var cc = bb["pro"];
					
					console.log(dataxjqx);
					var clientxqqw = new Clientxqqw({
					pro: cc
					});
					
					client.emit('info_user', clientxqqw.toString());
////////////////////
					  })
					})

					req.on('error', error => {
					  console.error(error)
					})

					req.write(dataxjq)
					req.end()
////////////////////// *** POST *** //////////////////////

});
////* ЧЕК ЮЗЕР *//////////////////////////////////////////


///////////////////////// * SF * ////////////////////////
function kickPl(player) {
console.log(`Проверка игрока [${player.username}] на активность`);
		
	var isfoundst = false;

	  for (i = 0; i < players.length; i++)
	  {
		  if (players[i].user_id == player.user_id && players[i].room == player.room)
		  {
		  isfoundst = true;
		  break;
		  }
	  }
	  if (!isfoundst)
			{
			console.log(`Игрок ${player.username} НЕ найден на сервере УДАЛЕЕН!--`);
			// ничего не делаем так как он уже был убит, либо завершил игру (game_result) и кикнут сервером
			}else{
			console.log(`Игрок ${player.username} найден на сервере ЖИВОЙ!++`);
		
				if (players[i].isonline == 0) // Если игрок не успел вернуться за тайминг то удаляем игрока из памяти 
				{
					console.log(`Игрок [${players[i].username}] игрок НЕ успел вернуться за тайминг---`);
					
					//и если у него есть убитыве противники в массиве то отправляем данные в MP
					if (datax[players[i].user_id].length>0)
					{
						console.log(`Игрок [${players[i].username}] имеет убитых игроков - отправляем в MP`);
						var ram = Number((Number(players[i].amount)*Number(datax[players[i].user_id].length))+Number(players[i].amount));
////////////////////// *** POST *** //////////////////////
						var crypto = require('crypto');
						var domd5 = game_id+":"+players[i].user_id+":"+players[i].room+":"+players[i].battle+":"+timestamp+":"+secret;
						var hash3 = crypto.createHash('md5').update(domd5).digest('hex'); 

						const https = require('https')

						const data = JSON.stringify({
						  game_id: game_id,
						  user_id: players[i].user_id,
						  room_id: players[i].room,
						  battle_id: players[i].battle,
						  timestamp: timestamp,
						  hash: hash3,
						  result_amount: ram,
						  start_timestamp:  Number(players[i].start_timestamp),
						  finish_timestamp: Number(Math.round(Date.now()/(1000))), 
						  data: datax[players[i].user_id],
						})

						const options = {
						  hostname: 'mindplays.com',
						  port: 443,
						  path: '/api/v1/multiplayer/result_game',
						  method: 'POST',
						  headers: {
							'Content-Type': 'application/json',
							'Content-Length': data.length
						  }
						}

						const req = https.request(options, res => {
						  console.log(`statusCode: ${res.statusCode}`)

						  res.on('data', d => {
							process.stdout.write(d)
						  })
						})

						req.on('error', error => {
						  console.error(error)
						})

						req.write(data)
						req.end()
////////////////////// *** POST *** //////////////////////
						

					// Делеес
					const sqlconnectiondel = mysql.createConnection({
					  host: sqhost,
					  user: squser,
					  database: sqdatabase,
					  password: sqpassword
					});

					const sqlxx = "DELETE FROM tanks_array WHERE datax=?";
					const dataxx = [players[i].user_id]; 
					sqlconnectiondel.query(sqlxx, dataxx, function(err, results) {
						if(err) console.log(err);
						//console.log(results);
					});
					sqlconnectiondel.end();
					//Дел	
					
						datax[players[i].user_id] = [];	// очищаем					
					}else{	
					console.log(`Игрок [${players[i].username}] НЕ ИМЕЕТ убитых противников`);					
					if (typeof(players[i]) !== 'undefined')
						{
							var crypto = require('crypto');
							var domd5 = game_id+":"+players[i].user_id+":"+players[i].room+":"+players[i].battle+":"+timestamp+":"+secret;
							var hash3 = crypto.createHash('md5').update(domd5).digest('hex'); 
							const https = require('https')

							const data = JSON.stringify({
							  game_id: game_id,
							  user_id: players[i].user_id,
							  room_id: players[i].room,
							  battle_id: players[i].battle,
							  timestamp: timestamp,
							  comment: "pl_disconnected",
							  hash: hash3,
							})

							const options = {
							  hostname: 'mindplays.com',
							  port: 443,
							  path: '/api/v1/multiplayer/close_game',
							  method: 'POST',
							  headers: {
								'Content-Type': 'application/json',
								'Content-Length': data.length
							  }
							}

							const req = https.request(options, res => {
							  console.log(`statusCode: ${res.statusCode}`)

							  res.on('data', d => {
								process.stdout.write(d)
							  })
							})

							req.on('error', error => {
							  console.error(error)
							})

							req.write(data)
							req.end()
							
						};
					}
					
					
						// Делеес
						const sqlconnection = mysql.createConnection({
						  host: sqhost,
						  user: squser,
						  database: sqdatabase,
						  password: sqpassword
						});

						const sql = "DELETE FROM tanks WHERE user_id=? AND room=?";
						const data = [players[i].user_id, players[i].room];
						sqlconnection.query(sql, data, function(err, results) {
							if(err) console.log(err);
							console.log("SQL:: Пользователь удален");
						});
						sqlconnection.end();
						// Дел
			
						//удаляем игрока из списка	
						console.log(`Игрок ${players[i].username} Кикнут таймингом`);
						client.broadcast.emit('destroy_player', players[i].toString());
						players.splice(players.indexOf(players[i]), 1);
				}else{
					console.log(`Игрок [${players[i].username}] игрок УСПЕЛ вернуться за тайминг+++`);
				}
			}
}
///////////////////////////// * FF * /////////////////////////////


client.on('do_me_bcreate', (data) =>
{	
data = JSON.parse(data);
rid = data.room_id
// Создание всех блоков для себя после входа в игру
for (let i in blocks) 
	{ 
	//if (blocks[i].room == data.room && blocks[i].hp > 0)
	if (blocks[i].room == rid && blocks[i].hp > 0)
		{ 
			client.emit('send_block', blocks[i].toString()); 
			//console.log(`Получен block`);
		}
	}
	
for (let i in bblocks) 
	{ 
	if (bblocks[i].room == rid)
		{ 
			client.emit('send_bb', bblocks[i].toString()); 
			//console.log(`Получен bblockID {$bblocks[i].bbindex}`);
		}
	}
});

// ЗВУК ///////////// ЗВУК ЗВУК
client.on('svol', (data) =>
{	
		data = JSON.parse(data);
		rid = data.svol
		
		
	// sql find
		
		const sqlconnectionifindsett = mysql.createConnection({
		host: sqhost,
		user: squser,
		database: sqdatabase,
		password: sqpassword
		});
							
		const sqlf2 = `SELECT * FROM player_settings WHERE userid=?`;
		const fdatas = [player.user_id];
		sqlconnectionifindsett.query(sqlf2, fdatas, function(err, results) {
		if(err)
		{
			console.log(err);
		}
			//console.log(results);
		
		if (results.length === 0) 
		{
			const sqlconnectioninsett = mysql.createConnection({
			host: sqhost,
			user: squser,
			database: sqdatabase,
			password: sqpassword
			});
							
			const sqlisertsettings = "INSERT INTO player_settings (userid, vol) VALUES (?, ?)";
			const usersettings = [player.user_id, rid];
			sqlconnectioninsett.query(sqlisertsettings, usersettings, function(err, results) {
			if(err) console.log(err);
			else console.log("Данные добавлены!+");
			});
			sqlconnectioninsett.end();
		}else{
			const sqlconnectioninsett = mysql.createConnection({
			host: sqhost,
			user: squser,
			database: sqdatabase,
			password: sqpassword
			});

			const sqlisertsettings = "UPDATE player_settings SET vol=? WHERE userid=?";
			const usersettings = [rid, player.user_id];
			sqlconnectioninsett.query(sqlisertsettings, usersettings, function(err, results) {
			if(err) console.log(err);
			else console.log("Данные добавлены!+");
			});
			sqlconnectioninsett.end();
		}
	});
	sqlconnectionifindsett.end();
});
///////////////////////////// * START PlAY * /////////////////////////////
///////////////////////////// * START PlAY * /////////////////////////////

// ***  получения данных об игроке - есть ли он на сервере *** //
client.on('if_i_online', (data) =>
{
data = JSON.parse(data);
  var iroom = Number(data.room);
  var iuser_id = Number(data.user_id);
  
console.log(`Проверка игрока на активность РЕКОНЕКТ ЛИ?`);
		
	var isfoundst = false;
	  for (i = 0; i < players.length; i++)
	  {
		  if (players[i].user_id == iuser_id && players[i].room == iroom)
		  {
		  isfoundst = true;
		  break;
		  }
	  }
	  if (!isfoundst)
			{
			console.log(`Игрок НЕ найден на сервере НЕ РЕКОНЕКТ!--`);
			// ничего не делаем так как он уже был убит, либо завершил игру (game_result) ибо тайминг дисконнекта == кикнут сервером
			}else{
				console.log(`Игрок найден на сервере ДА РЕКОНЕКТ!++`);
				/// отправляем игрока сразу в игру минуя лобби
				
				var clientrc = new Clientrc({
				ifrec: "yes"	
				});
				client.emit('if_u_online', clientrc.toString());
			}
  
  
  
});
// *** получения данных об игроке - есть ли он на сервере *** //



// *** POST начать играть *** //
client.on('do_me_gotoroom', (data) =>
{
data = JSON.parse(data);
  var iroom = Number(data.room);
  var iuser_id = Number(data.user_id);
  var ibattle_id = Number(data.battle_id);
  
  
////***////
var findrm=false;
for (let i in players) 
	{
		if ( (players[i].user_id == iuser_id) &&  (players[i].room == iroom) && !(players[i].battle == ibattle_id)) // нахожусь ли я уже в игре
		{
			findrm=true;
			break;
		}
	}
	if (findrm) // +
		{
				console.log(`findrm!++`);
				//players[i].isonline=0;
				//var sxplayer = players[i]; // массив мой  
				players[i].isonline=0;
				//sxplayer.isonline = 0;
				setTimeout(kickPl, 100,players[i]);
		}else // -
		{
			console.log(`findrm!--`);
		}
////***////

//////////////////////////////////  
	var crypto = require('crypto');
	var domd5 = game_id+":"+data.room+":"+timestamp+":"+secret;
	var hash3 = crypto.createHash('md5').update(domd5).digest('hex'); 
	const https = require('https')

	const jdata = JSON.stringify({
	  game_id: game_id,
	  users: [{
			user_id: iuser_id,
			battle_id: ibattle_id,
			},
			],
	  room_id: iroom,
	  timestamp: timestamp,
	  hash: hash3,
	});

	const options = {
	  hostname: 'mindplays.com',
	  port: 443,
	  path: '/api/v1/multiplayer/start_game',
	  method: 'POST',
	  headers: {
		'Content-Type': 'application/json',
		'Content-Length': jdata.length
	  }
	}

	const req = https.request(options, res => {
	  //console.log(`statusCode: ${res.statusCode}`)
		
		if (res.statusCode==200) // ЕРРОР ПАДЕНИЯ СЕРВЕРА ПРОРАБОТАН
		{ 
		res.on('data', d => {
		//process.stdout.write(d) // DEBUG
		
		var data = JSON.parse(d);
		//console.log(d); //DEBUG
		
		//let fs = require('fs');
		//fs.appendFileSync("client_data.txt","\n"+`${d}`); // DEBUG data
	
		
		var apidata = data["data"];
		
		var apidgame = apidata["game"];
		var amount = apidgame["amount"]; // TODO ПРОРАБОТАТЬ ЕРРОР ПАДЕНИЯ СЕРВЕРА !!!
		
		var gamount = apidgame["game"]; 
		var wallet = gamount["wallet"]; 
		
		var apidusr = apidata["users"];
		var apidusrz = apidusr[0];
		var username = apidusrz["name"];
		//console.log(username);
		

		console.log(`amount ${amount}`);
		
		console.log(`GWallet: ${wallet}`);
		
		console.log(`username ${username}`);
		
		var clientx = new Clientx({
		amount: amount,
		username: username,
		wallet: wallet
		
		});
		
		client.emit('do_gotoroom', clientx.toString());
		
		
	  })
		}else{
			res.on('data', d => {
			process.stdout.write(d)
			
			var data = JSON.parse(d);
			console.log(d);
			})
		}
		
	})

	req.on('error', error => {
	  console.error(error)
	})

	req.write(jdata)
	req.end()
//////////////////////////////////  

});

// *** POST начать играть *** //
///////////////////////////// * END START PlAY * /////////////////////////////
///////////////////////////// * END START PlAY * /////////////////////////////


// PiNG pOng ///////////////
client.on('ping', (data) => {
		data = JSON.parse(data);
		
		var xdataplpong = new xdata_vol({
		qw: 1
		});
		
		client.emit('pong', xdataplpong.toString());
		});
// PiNG pOng ///////////////
// PiNG pOng ///////////////


///////////////////////////// * START PlAYER * /////////////////////////////
///////////////////////////// * START PlAYER * /////////////////////////////
	// Это событие будет вызвано, когда клиент запросит присоединение к игре.
	// Затем последует проверка - если пользователь с данным user_id в игре, 
	//[если да - присвоит пользователю его танк] , иначе создаст новый танк
client.on('create_player', (data) =>
{

data = JSON.parse(data);
if (players.length > 0)
	{
		var isfound = false;
		for (i = 0; i < players.length; i++)
		{
			if (players[i].user_id == data.user_id && players[i].room == data.room)
			{
			isfound = true;
			break;
			}
		}
		if (!isfound)
			{
			var playerId = clientId++;
			console.log(`Игрок ${data.username} ${data.user_id} !== НЕ найден создаю...`);
							 player = new Player({
								socket: client,
								id: playerId, // BD server
								isonline: 1,
								user_id: data.user_id, // BD MINDPLAY
								room: data.room,
								battle: data.battle,
								username: data.username,
								amount: data.amount,
								start_timestamp: Number(Math.round((Date.now())/(1000))), 
								imageindex: data.imageindex,
								tankcolor: data.tankcolor,
								spriteindex: data.spriteindex,
								imageangle: data.imageangle,
								hp: data.hp,
								direction: data.direction,
								x: 1,
								y: 1,
								image_alpha: data.image_alpha
							});
							
								// Добавление данных
							const sqlconnection = mysql.createConnection({
							  host: sqhost,
							  user: squser,
							  database: sqdatabase,
							  password: sqpassword
							});

							const userad1 = [ data.user_id, data.username, data.room, data.battle, data.amount, Number(Math.round((Date.now())/(1000))), "1", playerId, "1", "1", data.imageindex, data.tankcolor, data.spriteindex, data.hp];
							const sql1 = "INSERT INTO tanks(user_id, username, room, battle, amount, start_timestamp, isonline, id, x, y, imageindex, tankcolor, spriteindex, hp) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
							sqlconnection.query(sql1, userad1, function(err, results) {
								if(err) console.log(err);
								else console.log("Данные добавлены");
							});
							sqlconnection.end();
							// Д д
							 // Добавляем в список игроков
							players.push(player);

							datax[data.user_id] = []; // присваиваем id игрока каждой переменной массива,чтобы вносить убитых соперников в индивидуальном порядке

							// Создаем себя!
							client.emit('create_player', player.toString());
							
							// Создаем себя для всех
							client.broadcast.emit('create_player_other', player.toString());
							
							
							// Создание всех остальных для себя, НЕ включая себя, потому что мы уже создали себя
							for (let i in players) {
								if (players[i].user_id !== data.user_id && players[i].room == data.room) {
									client.emit('create_player_other', players[i].toString());
								}
							}
			}else{
			console.log(`Найден игрок ${data.username} ${data.user_id} ==  ${players[i].user_id}  возвращаю...`);
				 player = new Player({
					socket: client,
					id: players[i].id,
					isonline: 1,
					user_id: players[i].user_id,
					username: players[i].username,
					room: players[i].room,
					battle: players[i].battle,
					amount: players[i].amount,
					start_timestamp: players[i].start_timestamp,
					imageindex: players[i].imageindex,
					tankcolor: players[i].tankcolor,
					spriteindex: players[i].spriteindex,
					imageangle: players[i].imageangle,
					hp: players[i].hp,
					direction: players[i].direction,
					x: players[i].x,
					y: players[i].y,
					image_alpha: players[i].image_alpha
				});
				
				players[i].room = data.room;
				players[i].isonline=1;
				
				// создаем себя
				client.emit('create_player', player.toString());				
				
				// Создание всех остальных для себя, НЕ включая себя
				for (let i in players) {
					if (players[i].user_id !== data.user_id && players[i].room == data.room) {
						client.emit('create_player_other', players[i].toString());
					}
				}
				
						/// Обновить баланс
						var ram = Number((Number(player.amount)*Number(datax[player.user_id].length))+Number(player.amount));
						var xdatacoin = new xdata_coin({
						plam: ram
						});
						
						client.emit('up_money_coin', xdatacoin.toString());
						//console.log(`:::::::: up_money_coin: ${ram}`);
						/// Обновить баланс
					
				console.log(`*+*+*+*+*СТАРЫЙ Игрок ${player.isonline} (${player.user_id})[${player.username}][${player.hp}] вернулся в комнату ${player.room} в батл айди ${player.battle}!`);
				//console.log(`Теперь всего игроков` + players.length);
}
	}else{
		var playerId = clientId++;
		//console.log(`Игроков 0 создаю ${data.username}`);
		 player = new Player({
            socket: client,
            id: playerId,
			isonline: 1,
            username: data.username,
			amount: data.amount,							
			user_id: data.user_id, // BD MINDPLAY
			room: data.room,
			battle: data.battle,
			start_timestamp: Number(Math.round((Date.now())/(1000))),
			imageindex: data.imageindex,
			tankcolor: data.tankcolor,
			spriteindex: data.spriteindex,
			imageangle: data.imageangle,
			hp: data.hp,
			direction: data.direction,
            x: 1,
            y: 1,
			image_alpha: data.image_alpha
        });
	
		// Добавление данных
		const sqlconnection = mysql.createConnection({
		  host: sqhost,
		  user: squser,
		  database: sqdatabase,
		  password: sqpassword
		});

		const userad1 = [ data.user_id, data.username, data.room, data.battle, data.amount, Number(Math.round((Date.now())/(1000))), "1", playerId, "1", "1", data.imageindex, data.tankcolor, data.spriteindex, data.hp];
		const sql1 = "INSERT INTO tanks(user_id, username, room, battle, amount, start_timestamp, isonline, id, x, y, imageindex, tankcolor, spriteindex, hp) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		sqlconnection.query(sql1, userad1, function(err, results) {
			if(err) console.log(err);
			else console.log("SQL:: Данные добавлены");
		});
		sqlconnection.end();
		// Д д
		
		
		 // Добавляем в список игроков
        players.push(player);
		

		datax[data.user_id] = []; // присваиваем id игрока каждой переменной массива,чтобы вносить убитых соперников в индивидуальном порядке

        // Создаем себя, только для себя!
        client.emit('create_player', player.toString());
		
		
        console.log(`+1+1+1+ПЕРВЫЙ Игрок (${player.user_id})[${player.username}][${player.hp}] создан c суммой ${player.amount} в комнате ${player.room} в батл айди ${player.battle}!`);
		//console.log(`Теперь всего игроков` + players.length);	
	}
});

//// Вещаем позицию игрока всем игрокам
    client.on('position_update', (data) => {
        data = JSON.parse(data);

        player.x = data.x;
        player.y = data.y;

        client.broadcast.emit('position_update', player.toString());
    });
	
//// ТРАНСЛЯЦИИ не глобальных ДАННЫХ игрока
	client.on('datax_update', (data) => {
        data = JSON.parse(data);
        player.direction = data.direction; // 1) direction - направление спрайта игрока
		player.image_alpha = data.image_alpha;
		player.bb = data.bb;
		
		client.emit('datax_update', player.toString());
		client.broadcast.emit('datax_update', player.toString());
    });
	
//// Игрок получил бонус 5:hp+=1
	client.on('hp_update', (data) => {
        data = JSON.parse(data);
		if (player.hp<3)
		{
        player.hp = 3;
		client.emit('gms_player_hp_update_all', player.toString());
		client.broadcast.emit('gms_player_hp_update_all', player.toString());
		}
    });
	
//// Игрок получил бонус 9:hp-=1
	client.on('hp_one', (data) => {
        data = JSON.parse(data);
        player.hp = 1;
		
		client.emit('gms_player_hp_update_all', player.toString());
		client.broadcast.emit('gms_player_hp_update_all', player.toString());
    });

//////При попадании снаряда обновляем данные
	client.on('player_hp_mm', (data) => {
        data = JSON.parse(data);
		
        //var suser_id = data.user_id; // получаем id игрока по кому попали
        var sdamage = data.damage; 	  // получаем значение урона 
			
		var ispfound = false;
	  for (i = 0; i < players.length; i++)
	  {
		  if (players[i].user_id == data.user_id)
		  {
		  ispfound = true;
		  break;
		  }
	  }
	  if (ispfound)
	  {
			var splayer = players[i]; // массив врага  
			if (splayer.bb !== "6") // ББ щит
			{
				
				splayer.hp -= sdamage; // -хп врага
				console.log(`Игрок (${player.user_id})[${player.username}][${player.hp}] нанес -${sdamage} HP по игоку (${splayer.user_id})[${splayer.username}][${splayer.hp}]`);
				
				client.emit('gms_player_hp_update_all', splayer.toString());
				client.broadcast.emit('gms_player_hp_update_all', splayer.toString());
				
				
				if (splayer.hp<=0)
				{
					client.emit('destroy_player', splayer.toString());
					client.broadcast.emit('destroy_player', splayer.toString());
					datax[player.user_id].push( // дополняем игроку-победителю выйгрышный тип данных в массив (A)
						{
							operation_type: 1,
							amount: Number(player.amount),
							opponent_id: Number(splayer.user_id),
							comment: "killer_exit",
							battle_id: Number(splayer.battle),
						},
					);
					
					// Добавление данных
					const sqlconnection = mysql.createConnection({
					  host: sqhost,
					  user: squser,
					  database: sqdatabase,
					  password: sqpassword
					});
					
					const user = [ player.user_id, 1, Number(player.amount), Number(splayer.user_id), "killer_exit", Number(splayer.battle)];
					const sql1 = "INSERT INTO tanks_array(datax, operation_type, amount, opponent_id, comment, battle_id) VALUES(?, ?, ?, ?, ?, ?)";
					sqlconnection.query(sql1, user, function(err, results) {
						if(err) console.log(err);
						else console.log("Данные array добавлены");
					});
					sqlconnection.end();
					// Д д
					
////////////////////// *** POST *** ////////////////////// 
					
					var crypto = require('crypto');
					var domd5 = game_id+":"+splayer.user_id+":"+splayer.room+":"+splayer.battle+":"+timestamp+":"+secret;
					var hash3 = crypto.createHash('md5').update(domd5).digest('hex'); 

					const https = require('https')
					

					
					if (datax[splayer.user_id].length>0)
					{
					var ram = Number(Number(splayer.amount)*Number(datax[splayer.user_id].length));	
					datax[splayer.user_id].push( // затем присваиваем проигрышный тип данных в массив, так как враг был убит (В)
						{
							operation_type: 2,
							amount: Number(splayer.amount),
							opponent_id: Number(player.user_id),
							comment: "death_exit",
							battle_id: Number(player.battle),
						},
					);	
						//var ram = Number((Number(splayer.amount)*Number(datax[splayer.user_id].length))Number(splayer.amount));
					}else{
						
					datax[splayer.user_id].push( // затем присваиваем проигрышный тип данных в массив, так как враг был убит (В)
						{
							operation_type: 2,
							amount: Number(splayer.amount),
							opponent_id: Number(player.user_id),
							comment: "death_exit",
							battle_id: Number(player.battle),
						},
					);	
					var ram = 0;	
					}
					const data = JSON.stringify({
					  game_id: game_id,
					  user_id: splayer.user_id,
					  room_id: splayer.room,
					  battle_id: splayer.battle,
					  timestamp: timestamp,
					  hash: hash3,
					  result_amount: ram,
					  start_timestamp:  Number(splayer.start_timestamp),
					  finish_timestamp: Number(Math.round(Date.now()/(1000))),
					  data: datax[splayer.user_id],
					})
					
					const options = {
					  hostname: 'mindplays.com',
					  port: 443,
					  path: '/api/v1/multiplayer/result_game',
					  method: 'POST',
					  headers: {
						'Content-Type': 'application/json',
						'Content-Length': data.length
					  }
					}

					const req = https.request(options, res => {
					  console.log(`statusCode: ${res.statusCode}`)

					  res.on('data', d => {
					process.stdout.write(d)
					  })
					})

					req.on('error', error => {
					  console.error(error)
					})

					req.write(data)
					req.end()
////////////////////// *** POST *** //////////////////////
					// Делеес
					const sqlconnectiondel = mysql.createConnection({
					  host: sqhost,
					  user: squser,
					  database: sqdatabase,
					  password: sqpassword
					});

					const sqlxx = "DELETE FROM tanks_array WHERE datax=?";
					const dataxx = [splayer.user_id]; 
					sqlconnectiondel.query(sqlxx, dataxx, function(err, results) {
						if(err) console.log(err);
						//console.log(results);
					});
					sqlconnectiondel.end();
					//Дел	
				
					datax[splayer.user_id] = []; // очищаем
					console.log(`:: Игрок (${player.user_id})[${player.username}][${player.hp}] убил игрока (${splayer.user_id})[${splayer.username}][${splayer.hp}]`);
					
					/// Обновить баланс
						var ram = Number((Number(player.amount)*Number(datax[player.user_id].length))+Number(player.amount));
						var xdatacoin = new xdata_coin({
						plam: ram
						});
						
						client.emit('up_money_coin', xdatacoin.toString());
						//console.log(`:::::::: up_money_coin: ${ram}`);
					/// Обновить баланс
					
						// Делеес
						const sqlconnectionq = mysql.createConnection({
						  host: sqhost,
						  user: squser,
						  database: sqdatabase,
						  password: sqpassword
						});

						const sqldel = "DELETE FROM tanks WHERE user_id=? AND room=?";
						const datadel = [splayer.user_id, splayer.room];
						sqlconnectionq.query(sqldel, datadel, function(err, results) {
							if(err) console.log(err);
							console.log("SQL:: Пользователь удален");
						});
						sqlconnectionq.end();
						// Дел
						
					players.splice(players.indexOf(splayer), 1);
				}
		  }else{
			  //console.log(`У игрока (${player.user_id})[${player.username}][${player.hp}] защита от урона (C)(C)(C)(C)(C)`);
		  }
	}else{
			console.log(`CRITICAL ERROR!: mp_uid (${data.user_id}) не найден!`);
		}
    });
	
//// Когда игрок просит отключить его - отклюаем его
    client.on('do_me_disconnect', () => {
			if (datax[player.user_id].length>0)
					{
						console.log(`Игрок [${player.username}] имеет убитых игроков - отправляем в MP`);
						var ram = Number((Number(player.amount)*Number(datax[player.user_id].length))+Number(player.amount));
						////////////////////// *** POST *** //////////////////////
						var crypto = require('crypto');
						var domd5 = game_id+":"+player.user_id+":"+player.room+":"+player.battle+":"+timestamp+":"+secret;
						var hash3 = crypto.createHash('md5').update(domd5).digest('hex'); 

						const https = require('https')

						const data = JSON.stringify({
						  game_id: game_id,
						  user_id: player.user_id,
						  room_id: player.room,
						  battle_id: player.battle,
						  timestamp: timestamp,
						  hash: hash3,
						  result_amount: ram,
						  start_timestamp:  Number(player.start_timestamp),
						  finish_timestamp: Number(Math.round(Date.now()/(1000))), 
						  data: datax[player.user_id],
						})

						const options = {
						  hostname: 'mindplays.com',
						  port: 443,
						  path: '/api/v1/multiplayer/result_game',
						  method: 'POST',
						  headers: {
							'Content-Type': 'application/json',
							'Content-Length': data.length
						  }
						}

						const req = https.request(options, res => {
						  console.log(`statusCode: ${res.statusCode}`)

						  res.on('data', d => {
							process.stdout.write(d)
						  })
						})

						req.on('error', error => {
						  console.error(error)
						})

						req.write(data)
						req.end()
						////////////////////// *** POST *** //////////////////////
						// Делеес
						const sqlconnectiondel = mysql.createConnection({
						  host: sqhost,
						  user: squser,
						  database: sqdatabase,
						  password: sqpassword
						});

						const sqlxx = "DELETE FROM tanks_array WHERE datax=?";
						const dataxx = [player.user_id]; 
						sqlconnectiondel.query(sqlxx, dataxx, function(err, results) {
							if(err) console.log(err);
							//console.log(results);
						});
						sqlconnectiondel.end();
						//Дел	
					
						datax[player.user_id] = [];	// очищаем					
					}else{	
					console.log(`Игрок [${player.username}] НЕ ИМЕЕТ убитых противников`);					
					if (typeof(player) !== 'undefined')
						{
							var crypto = require('crypto');
							var domd5 = game_id+":"+player.user_id+":"+player.room+":"+player.battle+":"+timestamp+":"+secret;
							var hash3 = crypto.createHash('md5').update(domd5).digest('hex'); 
							const https = require('https')

							const data = JSON.stringify({
							  game_id: game_id,
							  user_id: player.user_id,
							  room_id: player.room,
							  battle_id: player.battle,
							  timestamp: timestamp,
							  comment: "pl_disconnected",
							  hash: hash3,
							})

							const options = {
							  hostname: 'mindplays.com',
							  port: 443,
							  path: '/api/v1/multiplayer/close_game',
							  method: 'POST',
							  headers: {
								'Content-Type': 'application/json',
								'Content-Length': data.length
							  }
							}

							const req = https.request(options, res => {
							  console.log(`statusCode: ${res.statusCode}`)

							  res.on('data', d => {
								process.stdout.write(d)
							  })
							})

							req.on('error', error => {
							  console.error(error)
							})

							req.write(data)
							req.end()
							
						};
					}
						//удаляем игрока из списка	
						for (let i in players)
						{
							if (players[i].user_id == player.user_id && players[i].room == player.room)
							{
								client.broadcast.emit('destroy_player', players[i].toString());
								client.emit('destroy_player', players[i].toString());
								
							// Делеес
							const sqlconnection = mysql.createConnection({
							  host: sqhost,
							  user: squser,
							  database: sqdatabase,
							  password: sqpassword
							});

							const sqldel = "DELETE FROM tanks WHERE user_id=? AND room=?";
							const datadel = [players[i].user_id, players[i].room];
							sqlconnection.query(sqldel, datadel, function(err, results) {
								if(err) console.log(err);
								console.log("SQL:: Пользователь удален");
							});
							sqlconnection.end();
							// Дел
						
								players.splice(players.indexOf(players[i]), 1);
							}
						}
    });
	
	
//// Когда игрок закрывает игру или обновляет страницу
client.on('disconnect', () => {
	if (typeof(player) !== 'undefined') // на случай если клиент постучался но не прошел дальше и вышел.
		{
			player.isonline=0;
			setTimeout(kickPl, 35000,player);
		}
	});
	
	
//// Когда у игрока заканчиваеться бонус
client.on('do_me_null', () => {
		player.bb=0;
		//console.log(`Бонус обнулен`)
	});
	
	
	
///////////////////////////// * END PlAYER * /////////////////////////////
///////////////////////////// * END PlAYER * /////////////////////////////




///////////////////////////// * START BULLET * /////////////////////////////
///////////////////////////// * START BULLET * /////////////////////////////
//////Создание пули и передача координат всем игрокам
client.on('create_bullet', () => {
		var ibullet = bulletId++;
		var xx=0;
		var yy=0;
		
		if (player.direction==0){var bullet = new Bullet(ibullet,player.x+8,player.y,15,1,player.direction,player.room);} //Right x+8 /не 50
		if (player.direction==90){var bullet = new Bullet(ibullet,player.x,player.y-8,15,1,player.direction,player.room);} //Up y-8
		if (player.direction==180){var bullet = new Bullet(ibullet,player.x-8,player.y,15,1,player.direction,player.room);} //Left x-8
		if (player.direction==270){var bullet = new Bullet(ibullet,player.x,player.y+8,15,1,player.direction,player.room);} //Down y+8
		
		bullets.push(bullet);
		client.broadcast.emit('send_bullet', bullet.toString()); // Для всех (с уроном)
		client.emit('send_bullet_self', bullet.toString()); // Для себя (обычную)
});
	

client.on('toserv_bullet_destroy', (data) => {
    data = JSON.parse(data);
		
    var ibullet = data.ibullet;
	for (i = 0; i < bullets.length; i++)
	{
		if (bullets[i].ibullet == ibullet)
		{
		client.broadcast.emit('fserv_bullet_destroy', bullets[i].toString()); // RE
		client.emit('fserv_bullet_destroy', bullets[i].toString());
		bullets.splice(bullets[i], 1); 
		}
	}
});
///////////////////////////// * END BULLET * /////////////////////////////
///////////////////////////// * END BULLET * /////////////////////////////




///////////////////////////// * START BLOCK * /////////////////////////////
///////////////////////////// * START BLOCK * /////////////////////////////
////// (Создание) Генерация блоков + вывод для себя + занесение в память сервера 
		client.on('create_block', (data) => {
			
		data = JSON.parse(data);
		var bindex = blocksId++;
        var x = data.x;
        var y = data.y;
        var blayer = data.blayer;
		var obb = data.obb;
        var hp = data.hp;
        var room = data.room;
		var gotDamageFrom = 0;
		
		var block = new Block(x,y,blayer,obb,hp,bindex,room,gotDamageFrom);
		
		blocks.push(block); 
		client.emit('send_block', block.toString()); 
    });
//////При попадании снаряда обновляем данные блока
	client.on('block_hp_mm', (data) => {
        data = JSON.parse(data);
		
        var bindex = data.bindex;
        var sdamage = data.damage;
		var gotDamageFrom = data.gotDamageFrom;
		
	  for (i = 0; i < blocks.length; i++)
	  {
		  if (blocks[i].bindex == bindex)
		  {
		blocks[i].hp -= sdamage; // -хп блока
		blocks[i].gotDamageFrom = gotDamageFrom; 
		
		if (blocks[i].hp>0)
		{
			client.emit('gms_block_hp_update', blocks[i].toString());
			client.broadcast.emit('gms_block_hp_update', blocks[i].toString());	
		}else{
			client.emit('destroy_block', blocks[i].toString());
			client.broadcast.emit('destroy_block', blocks[i].toString());
		}
		  break;
		  }
	  }
    });
//////При запросе удалить блок
	client.on('block_destroy', (data) => {
         data = JSON.parse(data);
		
        var bindex = data.bindex;
		
	  for (i = 0; i < blocks.length; i++)
	  {
		  if (blocks[i].bindex == bindex)
		  {
		console.log(`Блок (${blocks[i].bindex}) уничтожен`);
		client.emit('destroy_block', blocks[i].toString());
		client.broadcast.emit('destroy_block', blocks[i].toString());
		  }
	  }
    });
///////////////////////////// * END BLOCK * /////////////////////////////
///////////////////////////// * END BLOCK * /////////////////////////////

///////////////////////////// * BONUS BLOCK * /////////////////////////////
///////////////////////////// * BONUS BLOCK * /////////////////////////////
////// Создание bблоков + вывод для себя + занесение в память сервера 
		client.on('create_bb', (data) => {
		data = JSON.parse(data);
			
		var bbindex = bblocksId++;
        var x = data.x;
        var y = data.y;
		var bb = data.bb;
        var blayer = data.blayer;
        var room = data.room;
        var act = data.act;
		
		var bblock = new Bblock(x,y,bb,blayer,room,bbindex,act);

		bblocks.push(bblock); 
		//console.log(`Cоздал бонус блок (${bbindex}) x${x}/y${y} [${bb}]`);
				

		client.emit('send_bb', bblock.toString()); 
		client.broadcast.emit('send_bb', bblock.toString()); 
    });
//////При запросе удалить bблок // игрок получил бонус
	client.on('bb_destroy', (data) => {
         data = JSON.parse(data);
		
        var bbindex = data.bbindex;
		var ibbonus = data.bbonus;

	  for (i = 0; i < bblocks.length; i++)
	  {
		  if (bblocks[i].bbindex == bbindex)
		  {
			bblocks[i].act = 0;

			player.bb=ibbonus

			console.log(`Игрок [${player.user_id}][${player.username}][${player.hp}] подобрал [${bblocks[i].bbindex}] (${bblocks[i].bb})`);
			//client.emit('bb_s_destroy', bblocks[i].toString());
			client.broadcast.emit('bb_s_destroy', bblocks[i].toString());
			//bblocks.splice(bblocks[i], 1); //bblocks on i
		  }
	  }
    });
///////////////////////////// * END BONUS BLOCK * /////////////////////////////
///////////////////////////// * END BONUS BLOCK * /////////////////////////////

///////////////////////////// * START CUSTOM * /////////////////////////////
///////////////////////////// * START CUSTOM * /////////////////////////////
/////ТЕСТ  CMD	
	client.on('create_message', (data) => {
        data = JSON.parse(data);
        player.gms_msg = data.gms_msg;
		var cmd = player.gms_msg;
		if (cmd == "1")
		{			
			console.log(`Начало списка игроков`);
			for (let i in players) 
				{
					console.log(`id: ${players[i].id} u_id: ${players[i].user_id} un:[${players[i].username}] rm:[${players[i].room}]`);
				}
			console.log(`Конец списка игроков`);
		}		
		else if (cmd == "2")
		{
			//console.log(`Инициирован ручной запуск протокола регенерации...`);
			//setTimeout(reGen, 10, player.room);
		}
		else if (cmd == "3")
		{
			console.log(`BB: ${player.bb}`);
		}else{
			console.log(`Команда не найдена!`);
		}
	});
//// END ТЕСТ CMD


///// online players	
	client.on('online_users', (data) => {
        data = JSON.parse(data);
			var plrmles=0;
			for (let i in players) 
				{
					if (players[i].room == player.room)
					{
						plrmles+=1;
					}
				}
				
				var xdataou = new xdata_ou({
				plrmle: plrmles
				});
				
				//console.log(`ONLINE: ${plrmles}`);
				client.emit('up_online_users', xdataou.toString());

	});
//// online players	
///////////////////////////// * END CUSTOM * /////////////////////////////
///////////////////////////// * END CUSTOM * /////////////////////////////

});