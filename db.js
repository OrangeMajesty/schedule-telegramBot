var mysql = require('mysql');

var con = mysql.createPool({
    host    : "localhost",
    user    : "root",
    port    : '3307',
    password: "root1234",
    database: 'ahpc-edu'
});



// function handleDisconnect() {
//     // con.connect(function(err) {
//     //     if(err) {
//     //         console.log('error when connecting to db:', err);
//     //         setTimeout(handleDisconnect, 2000);
//     //     }
//     // });
//
//     // con.on('error', function(err) {
//     //     console.log('db error', err);
//     //     if(err.code === 'PROTOCOL_CONNECTION_LOST') {
//     //         handleDisconnect();
//     //     } else {
//     //         throw err;
//     //     }
//     // });
// }

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

module.exports.getGroupsById = function (id) {
    return new Promise(function(resolve) {
        var deps = [];

        con.getConnection(function(err, connect) {
            con.query('SELECT * FROM tb_group WHERE `id_department` = ?', id, function (error, result) {

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

