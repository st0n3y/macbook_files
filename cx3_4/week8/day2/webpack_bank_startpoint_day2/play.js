var MongoClient = require('mongodb').MongoClient

var url = 'mongodb://localhost:27017/myproject';

MongoClient.connect(url, function(err, db) {
  var collection = db.collection("accounts");
  collection.find({}).toArray(function(err, docs) {
    db.close();
  });
});