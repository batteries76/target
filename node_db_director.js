console.log("mongo importer");

const express = require('express');
const MongoClient = require('mongodb').MongoClient;
const app = express();
var LineByLineReader = require('line-by-line'),
  lr = new LineByLineReader('nine_letter_word_file.txt');

var db;

// for(i=0;i<3;i++){
//   lr.on('line', function (line) {
//     // 'line' contains the current line without the trailing newline character.
//     console.log(line);
//     console.log("UHUHUH");
//   });
// }

MongoClient.connect('mongodb://db_load:db_load@ds019906.mlab.com:19906/target_words', (err, database) => {
  if (err) {
    return console.log(err + " WTF now?")
  }
  db = database
  app.listen(3000, () => {
  console.log('listening on 3000')
    // for(i=0;i<3;i++){
    //   console.log("IN this thing");
    //   lr.on('line', function (line) {
    //     // 'line' contains the current line without the trailing newline character.
    //     console.log(line);
    //     console.log("HKSJHKJSH");
    //   });
    // }
  })

  console.log('Got here bloody finally');


  var collection = db.collection('nineLetters');

  lr.on('error', function (err) {
  	// 'err' contains error object
    console.log('Something went bad, ' + err);
  });

  lr.on('line', function (line) {
      // pause emitting of lines...
      lr.pause();

      console.log(line);
      console.log("DUBBADUB");
      // ...do your asynchronous line processing..
      setTimeout(function () {
        console.log(line);
        console.log("WEWRSVJSH");
          // ...and continue emitting lines.
          lr.resume();
      }, 3000);
  });

  console.log("HERE");

});

lr.on('end', function () {
  // All lines are read, file is closed now.
  console.log("file shut tight");
});
