require( 'minitest/autorun' )
require 'minitest/rg'
require_relative( '../bank_account' )
require_relative( '../bank' )

class TestBank < MiniTest::Test

  def setup
    bank_account1 = BankAccount.new( "Jay", 5000, "business" )
    bank_account2 = BankAccount.new( "Rick", 1, "personal" )
    bank_account3 = BankAccount.new( "Val", 800, "personal" )
  
    bank_accounts = [ bank_account1, bank_account2, bank_account3 ]

    @bank = Bank.new( bank_accounts )

  end

  def test_bank_account_initial_state()
    assert_equal( 3, @bank.number_of_accounts )
  end

  def test_bank_total()
    assert_equal( 5801, @bank.bank_total )
  end

  def test_average_value()
    assert_equal( 1933.67, @bank.average_value )
  end

  def test_business_total()
    assert_equal( 5000, @bank.business_total )
  end

  def test_largest_account_holder()
    assert_equal( "Jay", @bank.largest_account_holder )
  end

  def test_monthly_fee()
    @bank.monthly_fee
    assert_equal( 13181, @bank.bank_total)
  end

end