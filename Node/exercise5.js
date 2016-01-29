/*# LEARN YOU THE NODE.JS FOR MUCH WIN!

## FILTERED LS (Exercise 5 of 13)

 Create a program that prints a list of files in a given directory,
 filtered by the extension of the files. You will be provided a directory
 name as the first argument to your program (e.g. '/path/to/dir/') and a
 file extension to filter by as the second argument.

 For example, if you get 'txt' as the second argument then you will need to
 filter the list to only files that end with .txt. Note that the second
 argument will not come prefixed with a '.'.

 The list of files should be printed to the console, one file per line. You
 must use asynchronous I/O.

─────────────────────────────────────────────────────────────────────────────

## HINTS

 The fs.readdir() method takes a pathname as its first argument and a
 callback as its second. The callback signature is:

    function callback (err, list) { /* ... */ /*}

 where list is an array of filename strings.

 Documentation on the fs module can be found by pointing your browser here:
 file://C:\Users\adil\AppData\Roaming\npm\node_modules\learnyounode\node_ap
 idoc\fs.html

 You may also find node's path module helpful, particularly the extname
 method.

 Documentation on the path module can be found by pointing your browser
 here:
 file://C:\Users\adil\AppData\Roaming\npm\node_modules\learnyounode\node_ap
 idoc\path.html

─────────────────────────────────────────────────────────────────────────────

  » To print these instructions again, run: learnyounode print
  » To execute your program in a test environment, run: learnyounode run

    program.js
  » To verify your program, run: learnyounode verify program.js
  » For help run: learnyounode help
*/
var fs = require('fs')
var path = require('path')


function getDirectoryFiles(printout) {


  fs.readdir(process.argv[2].toString(), function doneReading(err, contents){
    //console.log(err)
    var lines = printout(contents)
  })
}

function logoutput(thefiles) {
  //console.log(thefiles)
  var word = "." + process.argv[3].toString()
  var patt = /txt/i
  //  var filteredFiles = thefiles.filter(function(yum) {if(yum.index(new RegExp(word))){
  var filteredFiles = thefiles.filter(function(yum) {if(yum.indexOf(word) > -1){
        return true
      }
      else{
        return false
      }})

    filteredFiles.forEach(function(a) {console.log(a)})
}

getDirectoryFiles(logoutput);
