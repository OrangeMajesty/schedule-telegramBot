var telegram = require('telegram-bot-api');
var token = require('token')

var api = new telegram({
    token: token,
    updates: {
        enabled: true,
        get_interval: 1000
    }
});

api.on('message', function(message)
{
    var chat_id = message.chat.id;

    // It'd be good to check received message type here
    // And react accordingly
    // We consider that only text messages can be received here

    if(chat_id == 568810006) {
        api.sendMessage({
            chat_id: message.chat.id,
            text: "Hi, " + message.chat.first_name
        })
            .then(function(message)
            {
                console.log(message, "your id:", message.chat.id);
            })
            .catch(function(err)
            {
                console.log(err);
            });
    }

    api.sendMessage({
        chat_id: message.chat.id,
        text: message.text + " your:" + JSON.stringify(message.chat)
    })
        .then(function(message)
        {
            console.log(message, "your id:", message.chat.id);
        })
        .catch(function(err)
        {
            console.log(err);
        });
});
