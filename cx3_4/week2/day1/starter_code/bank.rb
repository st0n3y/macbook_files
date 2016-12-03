class Bank

  def initialize( bank_accounts )
    @accounts = bank_accounts
  end

  def number_of_accounts()
    return @accounts.length
  end

  def bank_total()
    total = 0
    for account in @accounts
      total += account.value
    end
    return total
  end

  def average_value()
     # average = bank_total / @accounts.length
     # return average.round
     return ( bank_total.to_f / @accounts.length.to_f ).round(2)
  end

  def business_total()
    total = 0
    for account in @accounts
      total += account.value if account.type == "business"
    end
    return total
  end

  def largest_account_holder()
    values = []
    for account in @accounts
      values << account.value
    end
    for account in @accounts
      return account.name if account.value == values.max
    end
  end

  # def largest_account_holder()
  #   biggest_account = accounts.first
  #   for account in @accounts
  #     if account.value > biggest_account.value
  #       biggest_account = account
  #     end
  #   end
  #   return biggest_account.name
  # end

  def monthly_fee
    
  end

end