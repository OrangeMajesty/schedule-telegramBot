var mysql = require('mysql');
var security = require('./config');

var con = mysql.createPool(security);

/// Получение отделений
module.exports.getDeps = function () {
    return new Promise(function(resolve) {
        var deps = [];

        con.getConnection(function(err, connect) {

            if (err) throw err;

            con.query('SELECT * FROM tb_department', function(error, result){

                if (error) throw error;

                if(result)
                    for (var i = 0; i !== result.length; i++){

                        let i_dep = {};

                        i_dep.id = result[i].id_department;
                        i_dep.name = result[i].name_department;
                        i_dep.class = 'Deps';

                        deps.push(i_dep);

                    }
                connect.release();
                resolve(deps);
            });

        });


    });
};

/// Получение групп
module.exports.getGroups = function () {
    return new Promise(function(resolve) {
        var deps = [];

        con.getConnection(function(err, connect) {

            if (err) throw err;

            con.query('SELECT * FROM tb_group', function (error, result) {

                if (error) throw error;

                if (result)
                    for (var i = 0; i !== result.length; i++) {

                        let i_dep = {};

                        i_dep.id = result[i].id_group;
                        i_dep.name = result[i].name_group;
                        i_dep.idDep = result[i].id_department;
                        i_dep.class = 'Groups';

                        deps.push(i_dep);
                    }
                connect.release();
                resolve(deps);
            });

        });
    });
};

/// Получение групп в отделениях
module.exports.getGroupsByDep = function (id) {
    return new Promise(function(resolve) {
        var deps = [];

        con.getConnection(function(err, connect) {

            if (err) throw err;

            con.query('SELECT * FROM tb_group WHERE `id_department` = ?', id, function (error, result) {

                if (error) throw error;

                if (result)
                    for (var i = 0; i !== result.length; i++) {

                        let i_dep = {};

                        i_dep.id = result[i].id_group;
                        i_dep.name = result[i].name_group;
                        i_dep.idDep = result[i].id_department;
                        i_dep.class = 'Groups';

                        deps.push(i_dep);
                    }
                connect.release();
                resolve(deps);
            });
        });

    });
};

/// Получение группы по id
module.exports.getGroupsById = function (id) {
    return new Promise(function(resolve) {
        var deps = [];

        con.getConnection(function(err, connect) {

            if (err) throw err;

            con.query('SELECT * FROM tb_group WHERE `id_group` = ?', id, function (error, result) {

                if (error) throw error;

                if (result)
                    for (var i = 0; i !== result.length; i++) {

                        let i_dep = {};

                        i_dep.id = result[i].id_group;
                        i_dep.name = result[i].name_group;
                        i_dep.idDep = result[i].id_department;
                        i_dep.class = 'Groups';

                        deps.push(i_dep);
                    }
                connect.release();
                resolve(deps);
            });
        });

    });
};

/// Получение заблокированного пользователя по id
module.exports.getBannedUserById = function (id) {
    return new Promise(function(resolve) {
        var users = false;

        con.getConnection(function(err, connect) {

            if (err) throw err;

            con.query('SELECT * FROM `tb_user` WHERE `id_telegram` = ? AND `status` = 1', id, function (error, result) {

                if (error) throw error;

                if (result[0])
                    users = true;

                connect.release();
                resolve(users);
            });
        });

    });
};

/// Получение пользователей
module.exports.getUsers = function () {
    return new Promise(function(resolve) {
        var users = [];

        con.getConnection(function(err, connect) {

            if (err) throw err;

            con.query('SELECT * FROM `tb_user`', '', function (error, result) {

                if (error) throw error;

                if (result)
                    for (var i = 0; i !== result.length; i++) {

                        let el = {};

                        // el.id = result[i].id_user;
                        el.name = result[i].user_name;
                        el.id = result[i].id_telegram;
                        el.class = 'Users';

                        users.push(el);
                    }
                connect.release();
                resolve(users);
            });
        });

    });
};

/// Получение пользователей
module.exports.getTeachersByDeps = function (id) {

    console.log(id);
    return new Promise(function(resolve) {
        var teachers = [];

        con.getConnection(function(err, connect) {

            if (err) throw err;

            con.query('SELECT * FROM `tb_teacher` WHERE `id_departament` = ?', id, function (error, result) {

                if (error) throw error;

                if (result)
                    for (var i = 0; i !== result.length; i++) {

                        let el = {};

                        el.id = result[i].id_teacher;
                        el.name = result[i].compact_name;
                        el.class = 'Teachers';

                        teachers.push(el);
                    }
                connect.release();
                resolve(teachers);
            });
        });

    });
};

/// Получение пользователя по telegram id
module.exports.getUsersId = function () {
    return new Promise(function(resolve) {
        var users = [];

        con.getConnection(function(err, connect) {

            if (err) throw err;

            con.query('SELECT `id_telegram` FROM `tb_user` GROUP BY `id_telegram`', '', function (error, result) {

                if (error) throw error;

                if (result)
                    for (var i = 0; i !== result.length; i++) {

                        let el = {};

                        el.id = result[i].id_telegram;

                        users.push(el);
                    }
                connect.release();
                resolve(users);
            });
        });

    });
};

/// Получение привязанных групп к пользователю по id
module.exports.getGroupsByUser = function (id) {
    return new Promise(function(resolve) {
        var deps = [];

        con.getConnection(function(err, connect) {

            if (err) throw err;

            con.query('SELECT * FROM `tb_user`\n' +
                'inner join tb_group on tb_user.id_group = tb_group.id_group\n' +
                'WHERE `id_telegram` = ? ' +
                'AND  tb_user.id_group != 0 ' +
                'AND tb_user.id_teacher = 0 ', id, function (error, result) {

                if (error) throw error;
                if (result)
                    for (var i = 0; i !== result.length; i++) {

                        let i_dep = {};

                        i_dep.id = result[i].id_user;
                        i_dep.name = result[i].user_name;
                        i_dep.idTel = result[i].id_telegram ;
                        i_dep.nameGroup = result[i].name_group ;
                        i_dep.idGroup = result[i].id_group ;
                        i_dep.idTeacher = result[i].id_teacher ;
                        i_dep.class = 'Groups';

                        deps.push(i_dep);
                    }
                connect.release();
                resolve(deps);
            });
        });

    });
};

/// Получение подписок к преподавателю id
module.exports.getTeachersByUser = function (id) {
    return new Promise(function(resolve) {
        var deps = [];

        con.getConnection(function(err, connect) {

            if (err) throw err;

            con.query('SELECT * FROM `tb_user`\n' +
                'inner join tb_teacher on tb_user.id_teacher = tb_teacher.id_teacher\n' +
                'WHERE `id_telegram` = ? ' +
                'AND `id_group` = 0 ' +
                'AND tb_user.id_teacher != 0', id, function (error, result) {

                if (error) throw error;
                if (result)
                    for (var i = 0; i !== result.length; i++) {

                        let i_dep = {};

                        i_dep.id = result[i].id_user;
                        i_dep.name = result[i].user_name;
                        i_dep.idTel = result[i].id_telegram ;
                        i_dep.idTeacher = result[i].id_teacher ;
                        i_dep.nameTeacher = result[i].compact_name;
                        i_dep.class = 'Teachers';

                        deps.push(i_dep);
                    }
                connect.release();
                resolve(deps);
            });
        });

    });
};

/// Отвязка группы
module.exports.decoupling = function (id) {
    return new Promise(function(resolve) {
        con.getConnection(function(err, connect) {

            if (err) throw err;

            con.query('DELETE FROM `tb_user` WHERE `id_user` = ?', id, function (error) {
                if (error) throw error;

                connect.release();
                resolve(true);
            });
        });

    });
};

/// Получение замены на текущую дату
module.exports.getReplacementByGroup = function (id) {
    return new Promise(function(resolve) {
        var schedule = [];
        con.getConnection(function(err, connect) {

            if (err) throw err;

            con.query('SELECT * FROM `tb_schedule` ' +
                'inner join tb_cabinet on tb_schedule.id_cabinet = tb_cabinet.id_cabinet ' +
                'inner join tb_teacher on tb_schedule.id_teacher = tb_teacher.id_teacher ' +
                'inner join tb_subject on tb_schedule.id_subject = tb_subject.id_subject ' +
                'inner join tb_time on tb_schedule.id_time = tb_time.id_time ' +
                'WHERE `date` >= cast((now()) as date) ' +
                'AND `date` < cast((now() + interval 1 day) as date) ' +
                'AND `is_replacement` = 1 ' +
                'AND `id_group` = ? ', id, function (error, result) {

                if (error) throw error;

                if (result)
                    for (var i = 0; i !== result.length; i++) {

                        let el = {};

                        el.id = result[i].id_schedule;
                        el.cabinet = result[i].name_cabinet;
                        el.teacher = result[i].compact_name ;
                        el.subject = result[i].name_subject ;
                        el.date = result[i].time ;
                        el.num = result[i].id_time ;

                        schedule.push(el);
                    }

                connect.release();
                resolve(schedule);
            });
        });

    });
};

/// Получение рассписания на текущую дату
module.exports.getScheduleByGroupTeacher = function (id, offset = 0) {
    return new Promise(function(resolve) {
        var schedule = [];
        con.getConnection(function(err, connect) {

            if (err) throw err;

            con.query('SELECT * FROM `tb_schedule` ' +
                'inner join tb_cabinet on tb_schedule.id_cabinet = tb_cabinet.id_cabinet ' +
                'inner join tb_teacher on tb_schedule.id_teacher = tb_teacher.id_teacher ' +
                'inner join tb_subject on tb_schedule.id_subject = tb_subject.id_subject ' +
                'inner join tb_time on tb_schedule.id_time = tb_time.id_time ' +
                'WHERE `date` >= cast((now() + interval 0+' + offset + ' day) as date) ' +
                'AND `date` < cast((now() + interval 1+' + offset + ' day) as date) ' +
                'AND tb_schedule.id_teacher = ? ', id, function (error, result) {

                if (error) throw error;

                if (result)
                    for (var i = 0; i !== result.length; i++) {

                        let el = {};

                        el.id = result[i].id_schedule;
                        el.cabinet = result[i].name_cabinet;
                        el.teacher = result[i].compact_name ;
                        el.subject = result[i].name_subject ;
                        el.date = result[i].time ;
                        el.num = result[i].id_time ;

                        schedule.push(el);
                    }

                connect.release();
                resolve(schedule);
            });
        });

    });
};

/// todo: может быть полее 3-х элементов в рассписании на день.
/// Получение рассписания
module.exports.getScheduleByGroup = async function (id, week) {

    return new Promise(function(resolve) {
        var schedule = [];
        con.getConnection(function (err, connect) {

            if (err) throw err;

            con.query(
                'SELECT * FROM `tb_schedule` ' +
                'inner join tb_cabinet on tb_schedule.id_cabinet = tb_cabinet.id_cabinet ' +
                'inner join tb_teacher on tb_schedule.id_teacher = tb_teacher.id_teacher ' +
                'inner join tb_subject on tb_schedule.id_subject = tb_subject.id_subject ' +
                'inner join tb_time on tb_schedule.id_time = tb_time.id_time ' +
                'WHERE `id_group` = ? ' +
                'AND DAYOFWEEK(`date`) = ? ' +
                'AND `is_replacement` = 0 ' +
                'ORDER BY `date` DESC', [id, week], function (error, result) {

                    if (error) throw error;

                    if (result)
                        for (var i = 0; i !== result.length; i++) {
                            let el = {};

                            el.id = result[i].id_schedule;
                            el.cabinet = result[i].name_cabinet;
                            el.teacher = result[i].compact_name;
                            el.subject = result[i].name_subject;
                            el.date = result[i].time;
                            el.num = result[i].id_time;

                            schedule.push(el);
                        }

                    connect.release();
                    resolve(schedule);
                });
        });
    });
};

/// Добавление пользователя
module.exports.addUser = function (username, telId, depId, teachId = 0) {
    return new Promise(function(resolve) {
        con.getConnection(function(err, connect) {

            if (err) throw err;

            let setData = [username, telId, depId, teachId];

            con.query('INSERT INTO `tb_user` (`id_user`, `user_name`, `id_telegram`, `id_group`, `id_teacher`) VALUES (NULL, ?, ?, ?, ?);', setData, function (error) {

                if (error) throw error;

                connect.release();
                resolve(true);

            });
        });

    });
};
