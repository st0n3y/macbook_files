require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../models/sales.rb' )
require_relative( '../models/pizza.rbd' )

class TestSales < MiniTest::Test

  def setup()
    pizza1 = Pizza.new( { 'first_name' => 'Val', 'last_name' => 'Gibson', 'topping' => 'Calzone', 'quantity' => 2 })
    pizza2 = Pizza.new( { 'first_name' => 'Jay', 'last_name' => 'Chetty', 'topping' => 'Margherita', 'quantity' => 4 })
  @pizzas = [ pizza1, pizza2 ]
  @sales = Sales.new( @pizzas )
  end

  def test_total_revenue()
    result = @sales.total_revenue
    assert_equal( 60, result )
  end

end