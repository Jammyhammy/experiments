function countNewLines(printout) {
  var fs = require('fs')
  fs.readFile(process.argv[2].toString(), function doneReading(err, contents){
    var lines = printout(contents.toString().split('\n').length.toString() - 1)
  })
}

function logoutput(theSplits) {
  console.log(theSplits)
}

countNewLines(logoutput);
//var lines = fs.readFileSync(process.argv[2]).toString()

//var theSplits = lines.split('\n')
//console.log(theSplits.length.toString() - 1)

//theSplits.forEach(function(a){console.log((theSplits.length.toString()));});

//var splitargs = args.slice(2,(args.length));
//splitargs.forEach(function(a){console.log(a);});
