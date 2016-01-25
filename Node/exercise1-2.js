var fs = require('fs');

var args = process.argv;
args = args.filter(function(yum) {if(yum > 0 && typeof(Number(yum)) === "number"){
    return true;
  }
  else{
    return false;
  }});
var sum = args.reduce((a, b) => +a + +b, 0);
console.log(sum);
