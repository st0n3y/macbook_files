require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../app.rb' )

class TestApp < MiniTest::Test

  def test_adds_1_to_each_item()
    assert_equal( [2,3,4], add_one( [1,2,3] ) )
  end

  def test_multiplies_each_item_by_2()
    assert_equal( [2,4,6], multiply_by_2( [1,2,3] ) )
  end

  def test_up_to_you_add()
    assert_equal( "Hello, Valerie", up_to_you{ |i| "Hello, " + i } )
  end

  def test_map_multiply_each_item_by_two
     assert_equal( [2,4,6], map( [1,2,3] ) {|i| i * 2} )
  end

   def test_map_add_two_to_each_item_by_two
     assert_equal( [3,4,5], map( [1,2,3] ) {|i| i + 2} )
   end

  def test_array_map_add_1_with_do()
    my_array = [1,2,3]

    result = my_array.map do |num|
      num + 1
    end

    assert_equal( [2,3,4], result )
  end

  def test_each
    my_array = [1,2,3]
    result = []

    result = my_array.each do |item|
      puts item
    end

    assert_equal( [1,2,3], result )

  end

end