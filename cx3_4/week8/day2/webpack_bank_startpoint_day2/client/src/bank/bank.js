var _ = require('lodash');
var Account = require('./account.js')
var Bank = function(){
  this.accounts = [];
  this.onFetchSuccess = null;
}

Bank.prototype = {
  addAccount: function(account){
    this.accounts.push(account);
  },

  findAccountByOwnerName:function(ownerName){
    return _.find(this.accounts, function(account){
      return account.owner === ownerName;
    })
  },

  filteredAccounts: function(type){
    if(!type) return this.accounts
    return _.filter(this.accounts, function(account){
      return account.type === type
    })
  },

  totalCash:function(type){
    var amounts = _.map(this.filteredAccounts(type), function(account){
      return account.amount
    })
    return _.sum(amounts)
  },

  accountAverage:function(){
    return this.totalCash()/this.accounts.length;
  },
  
  fetchAccounts:function(){
    var url = 'http://localhost:3000/accounts';
    var request = new XMLHttpRequest();
    request.open("GET", url);
    request.onload = function() {
      if(request.status === 200) {
        var sampleAccounts = JSON.parse(request.responseText)
        for(account of sampleAccounts) {
          this.addAccount(new Account(account));
        }
        this.onFetchSuccess();
      }
    }.bind(this);
    request.send(null);
  }
};

module.exports = Bank;