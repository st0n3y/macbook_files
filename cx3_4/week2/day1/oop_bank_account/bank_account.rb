# ACCOUNTS = [
#   {holder_name: "Jay", amount: 500, type: "business"}
# ]

# def get_account_name()
#   return ACCOUNTS[0][:holder_name]
# end

class BankAccount
  
  attr_accessor :holder_name, :amount, :type

  def initialize( holder_name, amount, type )
    @holder_name = holder_name
    @amount = amount
    @type = type
  end

  def pay_in( amount_in )
    @amount += amount_in
  end

  def pay_monthly_fee( fee )
    return @amount -= fee if @type == "personal"
    return @amount -= fee * 2
  end

  # def pay_monthly_fee()
  #   @amount -= 50 if @type == "personal"
  #   @amount -= 100 if @type == "business"
  # end

  # def holder_name()
  #   return @holder_name
  # end

  # def amount()
  #   return @amount
  # end

  # def type()
  #   return @type
  # end

  # def set_name( new_name )
  #   return @holder_name = new_name
  # end

  # def set_amount( new_amount )
  #   return @amount = new_amount
  # end

  # def set_type( new_type )
  #   return @type = new_type
  # end

end