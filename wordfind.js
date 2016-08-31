console.log("in wordfinder");

var fs = require('fs');

fs.readFile('words', function (err, data) {

  // If an error occurred, throwing it will
  // display the exception and end our app.
  if (err) throw err;

  // logData is a Buffer, convert to string.
  var text = data.toString();

  // Break up the file into lines.
  var words = text.split('\n');

  for(i=0;i<3;i++){
    console.log(words[i]);
  }

  nineSelected = [];

  words.forEach(function(word) {
    wordArr = word.split('');
    if (wordArr.length == 9){
      if (wordArr[0] == wordArr[0].toLowerCase()){
        nineSelected.push(word);
      }
    }

  });

  var fs = require('fs');

  var newFile = fs.createWriteStream('nineSelected.txt');
  newFile.on('error', function(err) {
    if (err) throw err;
  });
  nineSelected.forEach(function(word) { newFile.write(word + '\n'); });
  newFile.end();

  // fs.writeFile("bigNine", function(err, nineSelected) {
  //   if(err) {
  //       return console.log(err);
  //   }
  //
  //   console.log("The file was saved!");
  // });

  // console.log(nineSelected);
});
