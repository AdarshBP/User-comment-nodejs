const http=require('http');
const express=require('express');
const bodyParser = require('body-parser');
const path =require('path');
var TelegramBot = require('node-telegram-bot-api'),
// Be sure to replace YOUR_BOT_TOKEN with your actual bot token on this line.
bot = new TelegramBot("1435684552:AAGaVCohGoeo6iNb0WY6E96dT2-RWN0VYfA", { polling: true });


var app=express();
app.set('port',(process.env.PORT || 8000))
app.set('view engine','ejs');
var data=[];
app.use(bodyParser.urlencoded({extend:false}));
app.get('/',(req,res)=>
{ 
    res.sendFile(path.join(__dirname,'views','comment.html'));
});

app.post('/submit',(req,res)=>
{
    var today = new Date().toLocaleDateString();
    data.push({
            date:today,
            name:req.body.comment_name,
            comment:req.body.comment_content
    });
    console.log("asd"+data);
    bot.sendMessage(234437958,"\n#"+ req.body.comment_name + "\n#"+ req.body.comment_content + "\n" + today);
    res.redirect('https://designers-group.herokuapp.com/index.html');
    //res.redirect('/');
});

app.get('/CommentSection',(req,res)=>{
    let allcommentspath=path.join(__dirname,'views','allComments.ejs');
    res.render(allcommentspath,{data:data});
});
//listing to port 3000
app.listen(app.get('port'),()=>{
    console.log('Node app is uprunning om port',app.get('port'));
});

bot.on('message', (msg) => {
    console.log(msg.chat.id);
    bot.sendMessage(msg.chat.id, 'Ill have the tuna. No crust.');
  });