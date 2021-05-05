//
// This is only a SKELETON file for the 'Bank Account' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export class BankAccount { //allows this class to be used in other files
  constructor() {
    this._balance;
    this._active = false; //set it default to false so that
  }
  open() {
    if(!this._active) { //! makes it false rather than equal false
      this._active = true; //assigns true value to this._active
      this._balance = 0; //makes the balance zero
    }
    else {
      throw new ValueError; 
    }
  }

  close() {
    if(this._active) {
      this._active = false;
    }
    else { 
      throw new ValueError;
    }
    
  }

  deposit(depositAmount) {
    if(depositAmount >= 0 && this._active) { 
      this._balance += depositAmount;
    }
    else {
      throw new ValueError;
    }
  }

  withdraw(withdrawAmount) {
    if(this._balance >= withdrawAmount && withdrawAmount >= 0 && this._active) {
        this._balance -= withdrawAmount;
    }
    else {
      throw new ValueError;
    }
  }

  get balance() {
    if(this._active) {     //only if BankAcc is active will there be a BankAcc balance to retrieve
    return this._balance;
    }
    else {
      throw new ValueError;
    }
  }
}

export class ValueError extends Error {
  constructor() {
    super('Bank account error');
  }
}