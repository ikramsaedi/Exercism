//
// This is only a SKELETON file for the 'Bob' exercise. It's been provided as a
// convenience to get you started writing code faster.
//


function shouting(message){
  if(message === message.toUpperCase() && /[a-zA-Z]/.test(message)) { //if u uppercase numbers, they will be the same
    return true; //get all ur functions to return either true or false, and get them to return the statement in the hey function
  }
}

function question(message){ //if u trim the message BEFoRE calling the endsWith("?") method, the question will end with a question mark bc the whitespace has been trimmed
  if(message.trim().endsWith("?")){ //have to put question mark AT THE END
    return true;
  }
}

function silence(message){
  if(/\S/.test(message)) {  // back slash capital S means non whitespace
    //test is a regex method -> searches for given regex in its parameter in either true false
    return false;
  }
  else {
    return true;
  }
}


export const hey = (message) => {
  if(silence(message)){
    return "Fine. Be that way!";
  }
  else if(shouting(message) && question(message)) { //do and and first !
    return "Calm down, I know what I'm doing!";
  }
  else if(shouting(message)) { //if shouting returns true, then return the statement
    return "Whoa, chill out!";
  }

  else if(question(message)){
    return "Sure."
  }
  else{
    return "Whatever.";
  }
}
