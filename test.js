var db = require('./db.js');

async function start() {

    let schedule = new Array();
    let schedule_data = await db.getScheduleByGroup(45);
    // console.log(schedule_data);
    let replacement_data = await db.getReplacementByGroup(45);
    // console.log(replacement_data);
    //
    schedule_data.forEach(function (el) {
        schedule[el.num] = {
            'cabinet': el.cabinet,
            'teacher': el.teacher,
            'subject': el.subject,
            'date': el.date,
            'rep': false
        };
    });
    //
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
    //
    let text = '';

    schedule.forEach(function (el) {
        if(el !== null)
            if(el.rep)
                text += '----- Замена -----\n'
        text += el.date + '\nКаб:' + el.cabinet + '\n' + el.teacher + '\n' + el.subject + '\n\n';
    });

    console.log(text);
}

start();