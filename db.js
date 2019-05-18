var mysql = require('mysql');

var con = mysql.createPool({
    host    : "localhost",
    user    : "root",
    port    : '3307',
    password: "root1234",
    database: 'ahpc-edu'
});


module.exports.getDeps = function () {
    return new Promise(function(resolve) {
        var deps = [];

        con.getConnection(function(err, connect) {
            con.query('SELECT * FROM tb_department', function(error, result){

                if (err) throw error;

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

module.exports.getGroups = function () {
    return new Promise(function(resolve) {
        var deps = [];

        con.getConnection(function(err, connect) {
            con.query('SELECT * FROM tb_group', function (error, result) {

                if (err) throw error;

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

module.exports.getGroupsByDep = function (id) {
    return new Promise(function(resolve) {
        var deps = [];

        con.getConnection(function(err, connect) {
            con.query('SELECT * FROM tb_group WHERE `id_department` = ?', id, function (error, result) {

                if (err) throw err;

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

module.exports.getGroupsById = function (id) {
    return new Promise(function(resolve) {
        var deps = [];

        con.getConnection(function(err, connect) {
            con.query('SELECT * FROM tb_group WHERE `id_group` = ?', id, function (error, result) {

                if (err) throw err;

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

module.exports.getGroupsByUser = function (id) {
    return new Promise(function(resolve) {
        var deps = [];

        con.getConnection(function(err, connect) {

                if (err) throw err;
                con.query('SELECT * FROM `tb_user`\n' +
                                'inner join tb_group on tb_user.id_group = tb_group.id_group\n' +
                                'WHERE `id_telegram` = ?', id, function (error, result) {
                if (result)
                    for (var i = 0; i !== result.length; i++) {

                        let i_dep = {};

                        i_dep.id = result[i].id_user;
                        i_dep.name = result[i].user_name;
                        i_dep.idTel = result[i].id_telegram ;
                        i_dep.nameGroup = result[i].name_group ;
                        i_dep.idGroup = result[i].id_group ;
                        i_dep.class = 'Groups';

                        deps.push(i_dep);
                    }
                connect.release();
                resolve(deps);
            });
        });

    });
};

module.exports.decoupling = function (id) {
    return new Promise(function(resolve) {
        con.getConnection(function(err, connect) {

            con.query('DELETE FROM `tb_user` WHERE `id_user` = ?', id, function (error) {
                if (err) throw error;



                connect.release();
                resolve(true);
            });
        });

    });
};

module.exports.getScheduleByGroup = function (id) {
    return new Promise(function(resolve) {
        var schedule = [];
        con.getConnection(function(err, connect) {

            console.log(id);
            con.query('SELECT * FROM `tb_schedule` inner join tb_cabinet on tb_schedule.id_cabinet = tb_cabinet.id_cabinet ' +
                'inner join tb_teacher on tb_schedule.id_teacher = tb_teacher.id_teacher ' +
                'inner join tb_subject on tb_schedule.id_subject = tb_subject.id_subject ' +
                'inner join tb_time on tb_schedule.id_time = tb_time.id_time ' +
                'WHERE `date` >= cast((now()) as date) ' +
                'AND `date` < cast((now() + interval 1 day) as date) ' +
                'AND `id_group` = ?', id, function (error, result) {

                if (err) throw error;

                if (result)
                    for (var i = 0; i !== result.length; i++) {

                        let el = {};

                        el.id = result[i].id_schedule;
                        el.cabinet = result[i].name_cabinet;
                        el.teacher = result[i].compact_name ;
                        el.subject = result[i].name_subject ;
                        el.date = result[i].time ;
                        el.num = result[i].id_time ;
                        // el.class = 'Groups';

                        schedule.push(el);
                    }

                connect.release();
                resolve(schedule);
            });
        });

    });
};

module.exports.addUser = function (username, telId, depId) {
    return new Promise(function(resolve) {
        con.getConnection(function(err, connect) {
            let setData = [username, telId, depId];

            con.query('INSERT INTO `tb_user` (`id_user`, `user_name`, `id_telegram`, `id_group`) VALUES (NULL, ?, ?, ?);', setData, function (error) {

                if (err) throw error;

                connect.release();
                resolve(true);
            });
        });

    });
};

