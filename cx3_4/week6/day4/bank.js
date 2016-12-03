var Bank = function(){
  this.accounts = [100,200,300,400];
  this.total = 0;
}

Bank.prototype = {
  setTotal: function(){
    this.total = 0;
    this.accounts.forEach( function( account ) {
      this.total += account;
      console.log( this );
    }.bind( this ) ); //Without the bind, 'this' would refer to the Node global object.
  }
}

var hsbc = new Bank();
console.log( "hsbc total = ", hsbc.total );
hsbc.setTotal();
console.log( "total after = ", hsbc.total );