#!/usr/bin/env node

// The above line is a shebang. On Unix-like operating systems, or environments,
// this will allow the script to be run by node, and thus turn this JavaScript
// file into an executable. In other words, to execute this file, you may run
// the following from your terminal:
//
// ./grep.js args
//
// If you don't have a Unix-like operating system or environment, for example
// Windows without WSL, you can use the following inside a window terminal,
// such as cmd.exe:
//
// node grep.js args
//
// Read more about shebangs here: https://en.wikipedia.org/wiki/Shebang_(Unix)

const fs = require("fs");
const path = require("path");

/**
 * Reads the given file and returns lines.
 *
 * This function works regardless of POSIX (LF) or windows (CRLF) encoding.
 *
 * @param {string} file path to file
 * @returns {string[]} the lines
 */
function readLines(file) {
  //finds the file without u having to input the path of it, and then reads it
  const data = fs.readFileSync(path.resolve(file), { encoding: "utf-8" });
  return data.split(/\r?\n/); //an array of lines of the contents of the file
}

const VALID_OPTIONS = [
  //change whats returned
  //takes in a boolean
  "n", // add line numbers
  "l", // print file names where pattern is found

  //how u check file & returns boolean
  "i", // ignore case
  "v", // return non matching matching lines
  "x", // the whole entire line must match the pattern
];

const ARGS = process.argv; //argv is a
//an array of strings
//everything thats written on the command line
//in this case process is node
//the tests run their own command, which is being referenced here

//console.log(ARGS); //use this to find out what args is, cant use log for some reason
//
// This is only a SKELETON file for the 'Grep' exercise. It's been provided as a
// convenience to get you started writing code faster.
//
// This file should *not* export a function. Use ARGS to determine what to grep
// and use console.log(output) to write to the standard output.

let pattern = "";
let flags = [];
let files = [];
let matches = "";

//console.log(pattern);

for (let i = 0; i < ARGS.length; i++) {
  if (ARGS[i].endsWith(".txt")) {
    files.push(ARGS[i]);
  } else if (ARGS[i].startsWith("-")) {
    flags.push(ARGS[i]);
  } else {
    pattern = ARGS[i];
  }
}

function doesLineMatch(line, pattern, flags){ //checks if the pattern has a match on any of the lines
  //the line matches if we provide -x and the line is equal to the pattern
  //return true
  if(flags.includes("-x") && line === pattern){
    return true;
  }
  else if(line.includes(pattern) && !(flags.includes("-x"))){
    return true;
  }
  else{
    return false;
  }
}

function lineFormatter(files, flags, filesElement, foundMatch, line, lineNumber){ //-l and -n and multi files
  if(flags.includes("-l") && foundMatch){ 
    if(!matches.includes(filesElement)){ //so if matches does not alr include the fileElement, then add it
      matches += `${filesElement}\n` //otherwise it wont b added (solves problem of files appearing multiple times when theres more than one match)
    }
  }
  
  //-n block
  else if(flags.includes("-n") && foundMatch){ 
    lineNumber += 1; //increment line numbers by 1 bc indexes start at zero
    lineNumber += ":" //then add a colon bc thats how the test wants it structured
    if(files.length > 1 && foundMatch){ 
      matches += `${filesElement}:${lineNumber}${line}\n`; //if multiple files
    }
    else if(foundMatch){
      matches += `${lineNumber}${line}\n`; //only one file
    }
  }

// if no flags, execute the pushToMatches function (default)
  else {
    pushToMatches(files, foundMatch, filesElement, line);
  }
}

function pushToMatches(files, foundMatch, filesElement, line){ //adds match to matches string
  if(files.length > 1 && foundMatch){
    matches += `${filesElement}:${line}\n`
  }
  else if(foundMatch) {
    matches += `${line}\n`
  }
}

files.forEach(function(filesElement, filesIndex){ //iterating thru the files array
  let lines = readLines(filesElement); //store result of readLines function (an array of all the lines in the file) with the designated file in the lines variable

  lines.forEach(function(linesElement, linesIndex){ //iterating thru the lines array
    let ogLine = linesElement; //save the original lineElement into a variable called ogLine

    //i-block
    if(flags.includes("-i")){
      pattern = pattern.toLowerCase(); //make the pattern lowercase
      linesElement = linesElement.toLowerCase(); //make the line ur iterating thru also lowercase
    }
    
    //x-block
    let doesMatch = doesLineMatch(linesElement, pattern, flags); //store the result (a bool of T/F) of the doesLineMatch function in doesMatch variable

    //v-block
    if(flags.includes("-v")){
      lineFormatter(files, flags, filesElement, !doesMatch, ogLine, linesIndex); //pass in these parameters into lineformater function
    }
    else{
      lineFormatter(files, flags, filesElement, doesMatch, ogLine, linesIndex);
    }
  });
});

console.log(matches);
