const http=require('http');
const express=require('express');
const bodyParser = require('body-parser');
const path =require('path');

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
    console.log(data);
    res.redirect('/');
});

app.get('/CommentSection',(req,res)=>{
    let allcommentspath=path.join(__dirname,'views','allComments.ejs');
    res.render(allcommentspath,{data:data});
});
//listing to port 3000
app.listen(app.get('port'),()=>{
    console.log('Node app is uprunning om port',app.get('port'));
});