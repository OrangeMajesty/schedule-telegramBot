var telegram = require('telegram-bot-api');
var token = require('./token');
var db = require('./db.js');

/// Рассылка каждый 18:xx час
var updateHour = 18;

log('Telergam bot Успешно запущен');

var api = new telegram({
    token: token.id,
    updates: {
        enabled: true,
        get_interval: 1000
    }
});

/// Обертка для логирования
function log(message) {
    console.log(
        '[' +
        (new Date).toUTCString() +
        '] : ' +
        message
    );
}

/// Проверка необходимости рассылки
async function update() {

    var now = new Date();

    if(now.getHours() == updateHour)
        sendler();
}

/// Рассылка всем подписаным
async function sendler() {

    log('Отправка рассписания с заменой');

    let users = await db.getUsersId();

    if(users)
        for (var usersIndex = 0; usersIndex !== users.length; usersIndex++) {
            await getReplacement(users[usersIndex]);
            await getScheduleForTeacher(users[usersIndex]);
        }

}

/// Обработка получения сообщений
api.on('message', async function(message) {
    if((await isBan(message.chat.id)))
        return;

    log('Получено сообщение от пользователя: \'' + message.chat.id + '\'');

    var startButton = {
        inline_keyboard: [
            [
                {
                    text: 'Получить расписание',
                    callback_data: 'get_Schedule'
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
                    text: 'Дополнительно',
                    callback_data: 'get_Other'
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

/// Обработка нажатия кнопки
api.on('inline.callback.query', async function(rep) {
    if((await isBan(rep.message.chat.id)))
        return;

    let _case = rep.data.split(':')[0];
    let _data = rep.data.split(':')[1];

    var chat = rep.message.chat;

    console.log(_case);
    console.log(_data);

    switch(_case) {

        /// Этапы отписки от группы
        case 'clear': clear(chat); break;
        case 'clear_Groups': clearGroup(chat, _data); break;

        /// Этапы отписки от преподавателя
        case 'clear_Teacher': clearTeacher(chat); break;
        case 'clear_Teachers_Teachers': clearTeacher(chat, _data); break;

        /// Этапы подписки групп
        case 'bind': bind(chat, 0); break;
        case 'bind_Deps': bind(chat, 1, _data); break;
        case 'bind_Groups': bind(chat, 2, _data); break;

        /// Этапы подписки преподавателей
        case 'bind_Teacher': bindTeacher(chat, 0); break;
        case 'bind_Teacher_Deps': bindTeacher(chat, 1, _data); break;
        case 'bind_Teacher_In_Teachers': bindTeacher(chat, 2, _data); break;

        /// Получение рассписания без замен
        case 'get_Schedule':
            getReplacement(chat);
            getScheduleForTeacher(chat);
            break;

        /// Получение доп. функций
        case 'get_Other': getOther(chat); break;
    }

});

/// Проверка блокировки пользователя
async function isBan(id) {

    var ban = await db.getBannedUserById(id);

    log('Получение статуса пользователя \'' + id + '\': ' +
        ((ban === true) ? 'Зпрещен' : 'Разрешен')
    );

    if(ban === true) {
        api.sendMessage({
            chat_id: id,
            text: "Вы заблокированы!"
        });
        return true;
    }
    return false;
}

/// Получение дополнительных функций
async function getOther(user) {
    log('Пользователь \'' + user.id + '\' запрашивает доп. функции.');

    var buttons = {
        inline_keyboard: [
            [
                {
                    text: 'Подписаться на преподавателя',
                    callback_data: 'bind_Teacher'
                }
            ],
            [
                {
                    text: 'Отписаться от преподавателя',
                    callback_data: 'clear_Teacher'
                }
            ]
        ]
    };

    api.sendMessage({
        chat_id: user.id,
        text: "Выберите команду",
        reply_markup: JSON.stringify(buttons)
    });

}

/// Получение рассписания без замен
async function getSchedule(user) {

    log('Пользователь \'' + user.id + '\' запрашивает рассписание.');

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
    if(users.length === 0)
        api.sendMessage({
            chat_id: user.id,
            text: 'У вас нет привязанной группы.'
        });
}

/// Получение рассписания для преподавателей
async function getScheduleForTeacher(user) {

    log('Пользователь \'' + user.id + '\' запрашивает рассписание с заменой.');


    var users = await db.getTeachersByUser(user.id);

    console.log(users);

    if(users.length === 0)
        api.sendMessage({
            chat_id: user.id,
            text: 'Вы не подписаны на преподавателей'
        });

    for (var usersIndex = 0; usersIndex !== users.length; usersIndex++) {

        let schedule = new Array();
        let schedule_data = await db.getScheduleByGroupTeacher(users[usersIndex].idTeacher);
        let teacherName = null;

        schedule_data.forEach(function (el) {

            if(teacherName === null)
                teacherName = el.teacher;

            schedule[el.num] = {
                'cabinet': el.cabinet,
                'teacher': el.teacher,
                'subject': el.subject,
                'date': el.date,
                'rep': false
            };
        });

        let text = '';

        schedule.forEach(function (el) {
            if(el !== null) {
                if (el.rep)
                    text += '----- Замена -----'
                text += el.date + '\nКаб:' + el.cabinet + '\n' + el.teacher + '\n' + el.subject + '\n\n';
            }
        });

        if(text)
            api.sendMessage({
                chat_id: user.id,
                text: 'Рассписание для ' + teacherName + '\n\n' + text
            });
    }
}

/// Получение рассписания с заменами
async function getReplacement(user) {

    log('Пользователь \'' + user.id + '\' запрашивает рассписание с заменой.');

    var users = await db.getGroupsByUser(user.id);

    if(users.length === 0)
        api.sendMessage({
            chat_id: user.id,
            text: 'Нет привязанной группы'
        });

    for (var usersIndex = 0; usersIndex !== users.length; usersIndex++) {

        let schedule = new Array();
        let schedule_data = await db.getScheduleByGroup(users[usersIndex].idGroup);
        let replacement_data = await db.getReplacementByGroup(users[usersIndex].idGroup);

        schedule_data.forEach(function (el) {
            schedule[el.num] = {
                'cabinet': el.cabinet,
                'teacher': el.teacher,
                'subject': el.subject,
                'date': el.date,
                'rep': false
            };
        });

        replacement_data.forEach(function (el) {
            if(el)
                schedule[el.num] = {
                    'cabinet': el.cabinet,
                    'teacher': el.teacher,
                    'subject': el.subject,
                    'date': el.date,
                    'rep': true
                };
        });

        let text = '';

        schedule.forEach(function (el) {
            if(el !== null) {
                if (el.rep)
                    text += '----- Замена -----'
                text += el.date + '\nКаб:' + el.cabinet + '\n' + el.teacher + '\n' + el.subject + '\n\n';
            }
        });

        if(text)
            api.sendMessage({
                chat_id: user.id,
                text: users[usersIndex].nameGroup + '\n---------------\n' + text
            });
        else
            api.sendMessage({
                chat_id: user.id,
                text: users[usersIndex].nameGroup + '\n---------------\n' + 'Расписание отсутствуют'
            });
    }
}

/// Первый этап отвязки группы
async function clear(user) {

    let group = await db.getGroupsByUser(user.id);

    var genButton = {};

    genButton.inline_keyboard = [];
    genButton.inline_keyboard.push([]);
    let col = 0;

    if(group.length === 0) {
        api.sendMessage({
            chat_id: user.id,
            text: 'Нет привязанной группы'
        });
    } else {
        for (var groupIndex = 0; groupIndex !== group.length; groupIndex++) {

            var tempButton = {};

            tempButton.text = group[groupIndex].nameGroup;
            tempButton.callback_data = 'clear_' + group[groupIndex].class + ':' + group[groupIndex].id;

            if (groupIndex % 4 === 0) {
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
}

/// Последный этап отвязки группы
async function clearGroup(user, idGroup) {

    let users = await db.getGroupsByUser(user.id);

    let flagDub = true;

    /// Проверка на дубликат
    if(users.length)
        for(let i = 0; i !== users.length; i++) {
            if (users[i].id === parseInt(idGroup)) {
                flagDub = false;
            }
        }

    if(flagDub === false) {
        log('Пользователь \'' + user.id + '\' отписался от группы c id: ' + idGroup + '.');
        await db.decoupling(idGroup);
        api.sendMessage({
            chat_id: user.id,
            text: "Вы отписались."
        });

    } else {
        log('Пользователь \'' + user.id + '\' пытался отписаться от привязанной группы c id: ' + idGroup + '.');
        api.sendMessage({
            chat_id: user.id,
            text: "Вы не подписаны на данную группу."
        });
    }
}

/// Отписка от преподавателя
async function clearTeacher(user, id = 0) {

    let teacher = await db.getTeachersByUser(user.id);

    if(id !== 0) {
        let flagDub = true;

        /// Проверка на дубликат
        if(teacher.length)
            for(let i = 0; i !== teacher.length; i++) {
                if (teacher[i].id === parseInt(id)) {
                    flagDub = false;
                }
            }

        if(flagDub === false) {
            log('Пользователь \'' + user.id + '\' отписался от преподавателя c id: ' + id + '.');
            await db.decoupling(id);
            api.sendMessage({
                chat_id: user.id,
                text: "Вы отписались."
            });

        } else {
            log('Пользователь \'' + user.id + '\' пытался отписаться от преподавателя c id: ' + id + '.');
            api.sendMessage({
                chat_id: user.id,
                text: "Вы не подписаны на данног преподавателя."
            });
        }
        return;
    }

    var genButton = {};

    genButton.inline_keyboard = [];

    if(teacher.length === 0) {
        api.sendMessage({
            chat_id: user.id,
            text: 'Вы не подписаны на преподавателей.'
        });
    } else {
        for (var teacherIndex = 0; teacherIndex !== teacher.length; teacherIndex++) {

            var tempButton = {};

            tempButton.text = teacher[teacherIndex].nameTeacher;
            tempButton.callback_data = 'clear_Teachers_' + teacher[teacherIndex].class + ':' + teacher[teacherIndex].id;

            genButton.inline_keyboard.push([]);
            genButton.inline_keyboard[teacherIndex].push(tempButton);
        }

        api.sendMessage({
            chat_id: user.id,
            text: "Выберите преподавателя",
            reply_markup: JSON.stringify(genButton)
        });
    }
}

/// Привязка пользователя к преподаветелю (по этапно)
async function bindTeacher(user, level, data) {

    switch (level) {

        /// Подписка на преподавателя
        case 2: {

            log('Пользователь \'' + user.id + '\' подписался на преподавателя c id: ' + data + '.');

            let teachers = await db.getTeachersByUser(user.id);

            let flagDub = true;

            /// Проверка на дубликат
            if(teachers.length)
                for(let i = 0; i !== teachers.length; i++) {
                    if (teachers[i].idTeacher === parseInt(data)) {
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
                await db.addUser(username, user.id, 0, data);
                api.sendMessage({
                    chat_id: user.id,
                    text: "Вы подписались на преподавателя."
                });
            } else {
                api.sendMessage({
                    chat_id: user.id,
                    text: "Вы уже подписаны."
                });
            }

            break;
        }

        /// Выбор преподавателя
        case 1: {
            let teachers = await db.getTeachersByDeps(data);

            var genButton = {};

            genButton.inline_keyboard = [];

            for (var teachersIndex = 0; teachersIndex !== teachers.length; teachersIndex++) {

                var tempButton = {};
                tempButton.text = teachers[teachersIndex].name;

                tempButton.callback_data = 'bind_Teacher_In_' + teachers[teachersIndex].class + ':' + teachers[teachersIndex].id;
                genButton.inline_keyboard.push([]);
                genButton.inline_keyboard[teachersIndex].push(tempButton);
            }

            api.sendMessage({
                chat_id: user.id,
                text: "Выберите преподавателя",
                reply_markup: JSON.stringify(genButton)
            });

            break;
        }

        /// Выбор отделения
        case 0: {

            let deps = await db.getDeps();

            var genButton = {};

            genButton.inline_keyboard = [];

            for (var depsIndex = 0; depsIndex !== deps.length; depsIndex++) {

                var tempButton = {};
                tempButton.text = deps[depsIndex].name;

                tempButton.callback_data = 'bind_Teacher_' + deps[depsIndex].class + ':' + deps[depsIndex].id;
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

/// Привязка пользователя к группе (по этапно)
async function bind(user, level, data = null) {

    switch(level) {

        /// Подписка на группу
        case 2:

            log('Пользователь \'' + user.id + '\' привязвл группу c id: ' + data + '.');

            let users = await db.getGroupsByUser(user.id);

            let flagDub = true;

            /// Проверка на дубликат
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
                await db.addUser(username, user.id, data);
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

        /// Выбор группы
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

        /// Выбор отделения
        case 0:{

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

/// Таймер отправки рассылки.
setInterval( function(){ update(); } , 1000*60*60);