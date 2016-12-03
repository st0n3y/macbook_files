require('minitest/autorun')
require_relative('../bank_account.rb')

class TestBankAccount < MiniTest::Test
  
  def test_account_name()
    jay_account = BankAccount.new( 'Jay', 5000, 'business')
    assert_equal( "Jay", jay_account.holder_name )
  end

  def test_account_amount()
    jay_account = BankAccount.new( 'Jay', 5000, 'business')
    assert_equal( 5000, jay_account.amount )
  end

  def test_account_type()
    jay_account = BankAccount.new( 'Jay', 5000, 'business')
    assert_equal( "business", jay_account.type )
  end

  def test_set_name()
    jay_account = BankAccount.new( 'Jay', 5000, 'business')
    jay_account.holder_name = "Rick"
    assert_equal( "Rick", jay_account.holder_name )
  end

  def test_set_amount()
    jay_account = BankAccount.new( 'Jay', 5000, 'business')
    jay_account.amount = 8000
    assert_equal( 8000, jay_account.amount )
  end

  def test_set_type()
    jay_account = BankAccount.new( 'Jay', 5000, 'business')
    jay_account.type = "personal"
    assert_equal( "personal", jay_account.type )
  end

  def test_pay_into_account()
    jay_account = BankAccount.new( 'Jay', 5000, 'business')
    jay_account.pay_in( 1000 )
    assert_equal( 6000, jay_account.amount )
  end

  def test_pay_monthly_fee()
    jay_account = BankAccount.new( 'Jay', 5000, 'business')
    rick_account = BankAccount.new( 'Rick', 5000, 'personal')
    jay_account.pay_monthly_fee( 50 )
    rick_account.pay_monthly_fee( 50 )
    assert_equal( 4900, jay_account.amount )
    assert_equal( 4950, rick_account.amount)
  end

  # def test_pay_monthly_fee()
  #   jay_account = BankAccount.new( 'Jay', 5000, 'business')
  #   rick_account = BankAccount.new( 'Rick', 5000, 'personal')
  #   jay_account.pay_monthly_fee( 50 )
  #   rick_account.pay_monthly_fee( 50 )
  #   assert_equal( 4900, jay_account.amount )
  #   assert_equal( 4950, rick_account.amount)
  # end

end