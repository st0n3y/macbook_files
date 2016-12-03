require( 'pry-byebug' )

  ACCOUNTS = [
  {
    holder_name: "Jay",
    amount: 55,
    type: "business"
  },
  {
    holder_name: "Rick",
    amount: 1,
    type: "personal"
  },
  {
    holder_name: "Keith",
    amount: 500,
    type: "business"
  },
  {
    holder_name: "Valerie",
    amount: 100,
    type: "personal"
  },
  {
    holder_name: "Michael",
    amount: 5,
    type: "personal"
  },
  {
    holder_name: "Kate",
    amount: 2000,
    type: "business"
  },
  {
    holder_name: "Tony",
    amount: 150,
    type: "personal"
  },
  {
    holder_name: "Sandy",
    amount: 4500,
    type: "business"
  }
]

def number_of_bank_accounts()
  return ACCOUNTS.length
end

def first_bank_account_holder()
  return ACCOUNTS[0][:holder_name]
end

def bank_account_owner_names()
  expected = []
  for account in ACCOUNTS
    expected.push(account[:holder_name])
  end
  return expected
end

def total_cash_in_bank()
  total = 0
  for account in ACCOUNTS
    total += account[:amount]
  end
  return total
end

def average_bank_account_value()
  total = 0
  for account in ACCOUNTS
    total += account[:amount]
  end
  average = total / ACCOUNTS.length
  return average
end

# def average_bank_account_value()
#   average = total_cash_in_bank() / number_of_bank_accounts()
#   return average
# end 


def largest_bank_account_holder()
 result = {}

 for hash in ACCOUNTS
   result[hash[:amount]] = hash[:holder_name]
 end

 return result.fetch(result.keys.max)

end

# def largest_bank_account_holder()
#   result = ACCOUNTS.first

#   for account in ACCOUNTS
#     if account[:amount] > result[:amount]
#       result = account
#     end
#   end

#   return result[:holder_name]

# end


def largest_personal_holder()
  total = []
  people = []

  for x in ACCOUNTS
    if x[:type] == "personal"
      total << x[:amount]
      people << x[:holder_name]
    end
  end
  return people[total.index(total.max)]
end


def total_cash_in_business_accounts()
  cash = 0

  for account in ACCOUNTS
    cash += account[:amount] if account[:type] == "business"
  end

  return cash

end