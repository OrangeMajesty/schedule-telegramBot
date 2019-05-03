var telegram = require('telegram-bot-api');
var token = require('./token');
var db = require('./db.js');

var api = new telegram({
    token: token.id,
    updates: {
        enabled: true,
        get_interval: 1000
    }
});

var startButton = {
    inline_keyboard: [
        [
            {
                text: 'Выбор группы',
                callback_data: 'bind'
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



api.on('message', function(message)
{
    var chat_id = message.chat.id;

    api.sendMessage({
        chat_id: message.chat.id,
        text: "Вас приветствует Актюбинский Высший политехнический колледж\n\nВыберите команду.",
        reply_markup: JSON.stringify(startButton)
    });

});

api.on('inline.callback.query', function(rep) {

    let _case = rep.data.split(':')[0];
    let _data = rep.data.split(':')[1];

    console.log(_case);

    switch(_case) {
        case 'config': config(rep.message.chat); break;

        case 'bind': bind(rep.message.chat, 0); break;
        case 'bind_Deps': bind(rep.message.chat, 1, _data); break;
        case 'bind_Groups': bind(rep.message.chat, 2, _data); break;

        default: help(rep.message.chat);
    }

});

async function config(user) {
    api.sendMessage({
        chat_id: user.id,
        text: "."
    });
}

async function help(user) {
    api.sendMessage({
        chat_id: user.id,
        text: "."
    });
}

async function bind(user, level, data = null) {
    switch(level) {
        case 2:
            console.log(user);
            api.sendMessage({
                chat_id: user.id,
                text: "Вы успешно привязаны к группе."
            });
            break;
        case 1:
            console.log(data);
            let groups = await db.getGroupsById(data);

            var genButton = new Object();

            genButton.inline_keyboard = new Array();
            genButton.inline_keyboard.push(new Array());
            let col = 0;

            for (var groupsIndex = 0; groupsIndex != groups.length; groupsIndex++) {

                var tempButton = new Object();

                tempButton.text = groups[groupsIndex].name;
                tempButton.callback_data = 'bind_' + groups[groupsIndex].class + ':' + groups[groupsIndex].name;

                if(groupsIndex%4 == 0) {
                    genButton.inline_keyboard.push(new Array());
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
        case 0:
            console.log(user);
            let deps = await db.getDeps();

            var genButton = new Object();

            genButton.inline_keyboard = new Array();

            for (var depsIndex = 0; depsIndex != deps.length; depsIndex++) {

                var tempButton = new Object();
                tempButton.text = deps[depsIndex].name;

                tempButton.callback_data = 'bind_' + deps[depsIndex].class + ':' + deps[depsIndex].id;
                genButton.inline_keyboard.push(new Array());
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
