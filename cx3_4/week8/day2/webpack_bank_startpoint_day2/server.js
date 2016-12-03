var express = require('express');
var app = express();
var path = require('path');
var fs = require('fs');
var bodyParser = require('body-parser');
var url = "mongodb://localhost:27017/bank"

//This will turn our HTML into a JS object.
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

//This lets our server find the sample data.
// var ACCOUNTS_FILE = path.join( __dirname + '/sample.json' );

var MongoClient= require("mongodb").MongoClient;

app.get('/', function (req, res) {
  res.sendFile(path.join(__dirname + '/client/build/index.html'));
});

app.get('/accounts', function(req, res) {
  // fs.readFile( ACCOUNTS_FILE, function( err, data ) {
  //   if( err ) {
  //     console.log( err );
  //     return;
  //   }
  //   res.json( JSON.parse( data ) );
  // } )

  MongoClient.connect(url, function(err, db) {
    var collection = db.collection("accounts");
    collection.find({}).toArray(function(err, docs) {
      res.json(docs);
      db.close();
    })
  })
});

app.post('/accounts', function(req, res) {
  console.log("Body: ", req.body);
  MongoClient.connect(url, function(err, db){
    var collection = db.collection("accounts");
    collection.insert(
      req.body
    )
  });

  //This will simply send an acknowledgement that the route is working.
  res.status(200).end();
});

app.use(express.static('client/build'));


var server = app.listen(3000, function () {
  var host = server.address().address;
  var port = server.address().port;

  console.log('Example app listening at http://%s:%s', host, port);
});