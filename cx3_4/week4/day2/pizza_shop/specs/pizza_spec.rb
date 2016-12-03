require 'minitest/autorun'
require 'minitest/rg'
require_relative '../models/pizza.rb'

class TestPizza < MiniTest::Test

  def setup()
    options = {
      'first_name' => 'Tony', #Params hash in controller takes strings as keys
      'last_name' => 'Goncalves',
      'topping' => 'Pepperoni',
      'quantity' => 10
    }

    @pizza = Pizza.new(options)
  end

  def test_first_name()
    assert_equal('Tony', @pizza.first_name)
  end

  def test_last_name()
    assert_equal('Goncalves', @pizza.last_name)
  end

  def test_pretty_name()
    assert_equal('Tony Goncalves', @pizza.pretty_name)
  end

  def test_topping()
    assert_equal('Pepperoni', @pizza.topping)
  end

  def test_quantity()
    assert_equal(Fixnum, @pizza.quantity.class)
    assert_equal(10, @pizza.quantity)
  end

end