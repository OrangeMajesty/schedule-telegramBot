var telegram = require('telegram-bot-api');
var token = require('./token');
var db = require('./db.js');

var updateHour = 12;

var api = new telegram({
    token: token.id,
    updates: {
        enabled: true,
        get_interval: 1000
    }
});

async function update(){

    var now = new Date();

    if(now.getHours() == updateHour)
        sendler();

}

setInterval( function(){ update(); } , 1000*60*60);

async function sendler() {
    let users = await db.getUsersId();

    if(users)
        for (var usersIndex = 0; usersIndex !== users.length; usersIndex++) {
            await getSchedule(users[usersIndex]);
            console.log(users[usersIndex]);

        }

}

api.on('message', async function(message) {
    if((await isBan(message.chat.id)))
        return;

    var startButton = {
        inline_keyboard: [
            [
                {
                    text: 'Получить расписание',
                    callback_data: 'getSchedule'
                }
            ],
            [
                {
                    text: 'Привязать группу',
                    callback_data: 'bind'
                },
                {
                    text: 'Отвязать группу',
                    callback_data: 'clear'
                }
            ],
            [
                {
                    text: 'Настройки',
                    callback_data: 'config'
                }
            ],
            [
                {
                    text: 'Помощь',
                    callback_data: 'help'
                }
            ]
        ]
    };

    api.sendMessage({
        chat_id: message.chat.id,
        text: "Вас приветствует Актюбинский Высший политехнический колледж\n\nВыберите команду",
        reply_markup: JSON.stringify(startButton)
    });

});

api.on('inline.callback.query', async function(rep) {
    if((await isBan(rep.message.chat.id)))
        return;

    let _case = rep.data.split(':')[0];
    let _data = rep.data.split(':')[1];

    var chat = rep.message.chat;

    console.log(_case);

    switch(_case) {
        case 'config': config(chat); break;

        case 'clear': clear(chat); break;
        case 'clear_Groups': clearGroup(chat, _data); break;

        case 'bind': bind(chat, 0); break;
        case 'bind_Deps': bind(chat, 1, _data); break;
        case 'bind_Groups': bind(chat, 2, _data); break;

        case 'getSchedule': getSchedule(chat); break;

        default: help(chat);
    }

});

async function isBan(id) {

    var ban = {
        // 419883796: true
    };

    if(ban[id]) {
        api.sendMessage({
            chat_id: id,
            text: "Бан!"
        });
        return true;
    }
    return false;
}

async function getSchedule(user) {

    var users = await db.getGroupsByUser(user.id);

    for (var usersIndex = 0; usersIndex !== users.length; usersIndex++) {

        let schedule = new Array();
        let schedule_data = await db.getScheduleByGroup(users[usersIndex].idGroup);

        schedule_data.forEach(function (el) {
            schedule[el.num] = {
                'cabinet': el.cabinet,
                'teacher': el.teacher,
                'subject': el.subject,
                'date': el.date
            };
        });

        let text = '';

        schedule.forEach(function (el) {
            if(el !== null)
                text += el.date + '\nКаб:' + el.cabinet + '\n' + el.teacher + '\n' + el.subject + '\n\n';
        });

        if(text)
            api.sendMessage({
                chat_id: user.id,
                text: users[usersIndex].nameGroup + '\n---------------\n' + text
            });
        else
            api.sendMessage({
                chat_id: user.id,
                text: users[usersIndex].nameGroup + '\n---------------\n' + 'Расписание отсутствует'
            });
    }
}

    async function config(user) {
    // await db.getScheduleByUserId(user.id);
    api.sendMessage({
        chat_id: user.id,
        text: ".config"
    });
}

async function clear(user) {

    let users = await db.getGroupsByUser(user.id);

    var genButton = {};

    genButton.inline_keyboard = [];
    genButton.inline_keyboard.push([]);
    let col = 0;

    for (var usersIndex = 0; usersIndex !== users.length; usersIndex++) {

        var tempButton = {};

        tempButton.text = users[usersIndex].nameGroup;
        tempButton.callback_data = 'clear_' + users[usersIndex].class + ':' + users[usersIndex].id;

        if(usersIndex%4 === 0) {
            genButton.inline_keyboard.push([]);
            col++;
        }

        genButton.inline_keyboard[col].push(tempButton);
    }

    api.sendMessage({
        chat_id: user.id,
        text: "Выберите группу",
        reply_markup: JSON.stringify(genButton)
    });
}

async function clearGroup(user, idGroup) {

    await db.decoupling(idGroup);

    api.sendMessage({
        chat_id: user.id,
        text: "Вы отвязали группу"
    });
}

async function help(user) {

    api.sendMessage({
        chat_id: user.id,
        text: ".help"
    });
}

async function bind(user, level, data = null) {

    switch(level) {
        case 2:

            let users = await db.getGroupsByUser(user.id);

            let flagDub = true;

            // Проверка на дубликат
            if(users.length)
                for(let i = 0; i !== users.length; i++) {
                    if (users[i].idGroup === parseInt(data)) {
                        flagDub = false;
                    }
                }

            let username = null;

            if(user.username) {
                username = user.username;
            }  else {
                if(user.first_name)
                    username = user.first_name;
                if(user.last_name)
                    username += ' ' + user.last_name;
            }

            if(flagDub === true) {
                db.addUser(username, user.id, data);
                api.sendMessage({
                    chat_id: user.id,
                    text: "Вы успешно привязаны к группе."
                });
            } else {
                api.sendMessage({
                    chat_id: user.id,
                    text: "Группа уже привязана."
                });
            }

            break;
        case 1:{
            console.log(data);
            let groups = await db.getGroupsByDep(data);

            var genButton = {};

            genButton.inline_keyboard = [];
            genButton.inline_keyboard.push([]);
            let col = 0;

            for (var groupsIndex = 0; groupsIndex !== groups.length; groupsIndex++) {

                var tempButton = {};

                tempButton.text = groups[groupsIndex].name;
                tempButton.callback_data = 'bind_' + groups[groupsIndex].class + ':' + groups[groupsIndex].id;

                if(groupsIndex%4 === 0) {
                    genButton.inline_keyboard.push([]);
                    col++;
                }

                genButton.inline_keyboard[col].push(tempButton);
            }

            api.sendMessage({
                chat_id: user.id,
                text: "Выберите группу",
                reply_markup: JSON.stringify(genButton)
            });
            break;
        }
        case 0:{
            console.log(user);
            let deps = await db.getDeps();

            var genButton = {};

            genButton.inline_keyboard = [];

            for (var depsIndex = 0; depsIndex !== deps.length; depsIndex++) {

                var tempButton = {};
                tempButton.text = deps[depsIndex].name;

                tempButton.callback_data = 'bind_' + deps[depsIndex].class + ':' + deps[depsIndex].id;
                genButton.inline_keyboard.push([]);
                genButton.inline_keyboard[depsIndex].push(tempButton);
            }

            api.sendMessage({
                chat_id: user.id,
                text: "Выберите отделение",
                reply_markup: JSON.stringify(genButton)
            });

            break;
        }
    }

}
