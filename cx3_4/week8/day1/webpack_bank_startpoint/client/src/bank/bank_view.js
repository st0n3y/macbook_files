var sampleAccounts = require( "../sample.json" );
var Bank = require( "./bank.js" );
var Account = require( "./account.js" );

var BankView = function( bank ) {
  this.bank = bank;
};

BankView.prototype = {

  render: function( bank ) {

    console.log( "We created a bank in the browser! ", bank );

    var totalDisplay = document.getElementById( "total" );
    totalDisplay.innerText = "Total: " + bank.totalCash().toFixed( 2 );

    var accountList = document.getElementById( "accounts" )

    for( account of bank.accounts ) {
     var accountListItem = document.createElement( "li" );
      accountListItem.innerText = account.owner + ": £" + account.amount.toFixed( 2 );
      accountList.appendChild( accountListItem );
    }


    var businessList = document.getElementById( "business-accounts" );
    var personalList = document.getElementById( "personal-accounts" );
    var businessAccounts = bank.filteredAccounts( "business" );
    var personalAccounts = bank.filteredAccounts( "personal" );

    for( account of businessAccounts ) {
      var businessListItem = document.createElement( "li" );
      businessListItem.innerText = account.owner + ": £" + account.amount.toFixed( 2 );
      businessList.appendChild( businessListItem );
    }

    for( account of personalAccounts ) {
      var personalListItem = document.createElement( "li" );
      personalListItem.innerText = account.owner + ": £" + account.amount.toFixed( 2 );
      personalList.appendChild( personalListItem );
    }

    var totalBusinessAccountDisplay = document.getElementById( "business-total" );
    var totalPersonalAccountDisplay = document.getElementById( "personal-total" );

    totalBusinessAccountDisplay.innerText = "Business Account Total: £" + bank.totalCash( "business" ).toFixed( 2 );
    totalPersonalAccountDisplay.innerText = "Personal Account Total: £" + bank.totalCash( "personal" ).toFixed( 2 );

    var interestBtn = document.getElementById( "interest" );

    interestBtn.onclick = function() {
      totalDisplay.innerText = "";
      accountList.innerText = "";
      businessAccounts.innerText = "";
      personalAccounts.innerText = "";
      bank.addInterest( 10 );
      this.render( bank );
      this.storeAccounts( bank.accounts );
    }.bind( this );

  },

  storeAccounts: function( accounts ) {
    localStorage.setItem( "storedAccounts", JSON.stringify( accounts ) );
  }

};

module.exports = BankView;