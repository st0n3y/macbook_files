var Bank = require( "./bank/bank.js" );
var sampleAccounts = require( "./sample.json" );
var Account = require( "./bank/account.js" );
var BankView = require( "./bank/bank_view.js" );

window.onload = function() {

  var storedAccounts = JSON.parse( localStorage.getItem( "storedAccounts" ) ) || sampleAccounts;

  var bank = new Bank();

  for( accountData of storedAccounts ) {
    bank.addAccount( new Account( accountData ) );
  }

  var bankView = new BankView( bank )

  bankView.render();
  
};