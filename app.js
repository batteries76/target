var express = require('express');
var app = express();

console.log("started server");

app.get('/', function(req, res){
  res.json({ message: 'here\'s the api' });
});

app.get('/home', function(req, res){
  res.json({message: 'ET phone home'});
});

app.listen(process.env.PORT || 8080);
