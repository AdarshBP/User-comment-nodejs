const http = require('http');
const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');
var TelegramBot = require('node-telegram-bot-api'),
    // Be sure to replace YOUR_BOT_TOKEN with your actual bot token on this line.
    bot = new TelegramBot("1435684552:AAGaVCohGoeo6iNb0WY6E96dT2-RWN0VYfA", {
        polling: true
    });

var messageid = 234437958;
var app = express();
app.set('port', (process.env.PORT || 8000))
app.set('view engine', 'ejs');
var data = [];
app.use(bodyParser.urlencoded({
    extend: false
}));
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'views', 'comment.html'));
});

app.post('/submit', (req, res) => {
    var today = new Date().toLocaleDateString();
    data.push({
        date: today,
        name: req.body.comment_name,
        comment: req.body.comment_content
    });
    console.log("asd" + data.toString());
    bot.sendMessage(messageid, "\n#" + req.body.comment_name + "\n#" + req.body.comment_content + "\n" + today);
    //res.redirect('https://designers-group.herokuapp.com/index.html');
    res.redirect('/');
});

app.get('/CommentSection', (req, res) => {
    let allcommentspath = path.join(__dirname, 'views', 'allComments.ejs');
    res.render(allcommentspath, {
        data: data
    });
});

app.get('/getFile/:name', (req, res) => {

    var fileName = req.params['name'];
    const fs = require('fs')
    const data="";

    try {
        data = fs.readFileSync('./files/SSH.sh', 'utf8')
        console.log(data);
        bot.sendMessage(data);
        res.send(data);
    } catch (err) {
        console.error(err);
        res.send("error");
    }
    
})



app.get('/message/:message', (req, res) => {

    var fileName = req.params['message'];
    bot.sendMessage(message);
    res.redirect('/');
});

//listing to port 3000
app.listen(app.get('port'), () => {
    console.log('Node app is uprunning om port', app.get('port'));
});

bot.on('message', (msg) => {
    messageid = msg.chat.id;
    console.log(msg.chat.id);
    bot.sendMessage(msg.chat.id, 'updated the message id to ' + messageid);
});