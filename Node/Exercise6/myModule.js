var fs = require('fs')
var path = require('path')
module.exports = function getDirectoryFiles(printout) {
    fs.readdir(process.argv[2].toString(), function doneReading(err, contents){
      //console.log(err)
      var word = "." + process.argv[3].toString()
      var filteredFiles = contents.filter(function(yum) {if(yum.indexOf(word) > -1){
            return true
          }
          else{
            return false
          }})

        filteredFiles.forEach(function(a) {console.log(a)})
    })
  }
