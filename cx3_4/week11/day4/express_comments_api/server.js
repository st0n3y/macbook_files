var express = require('express');
var app = express();
var path = require('path');
var fs = require('fs');
var bodyParser = require('body-parser');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

app.use(function(req, res, next){
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
  next();
})

var MongoClient = require('mongodb').MongoClient
var url = 'mongodb://localhost:27017/comment_application';

app.get('/api/comments', function(req,res){
  MongoClient.connect(url, function(err, db) {
    var collection = db.collection('comments');
    collection.find({}).toArray(function(err, docs) {
      res.json(docs);
      db.close();
    });
  });
})

app.post('/api/comments', function(req,res){
  MongoClient.connect(url, function(err, db) {
    var collection = db.collection('comments');
    collection.insert(
      { "author": req.body.author,
        "text": req.body.text,
      }
    )
    res.status(200).end()
    db.close();
  });
})


// We are not returning any HTML or static files, so we do not need this.

// app.get('/', function (req, res) {
//   res.sendFile(path.join(__dirname + '/client/build/index.html'));
// });

// app.use(express.static('client/build'));


// We set this to listen at a different port to the front end.

var server = app.listen(5000, function () {
  var host = server.address().address;
  var port = server.address().port;

  console.log('Example app listening at http://%s:%s', host, port);
});