require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( 'warehouse.rb' )

class TestWarehouse < MiniTest::Test

  def test_return_item_at_bay()
    assert_equal( "rubber band", return_item_at_bay( "a10" ) )
  end

  def test_return_bay_for_item()
    assert_equal( "a7", return_bay_for_item( "bookmark") )
  end

  def test_return_items_for_bays()
    expected = [ "glowstick", "shovel"]
    result = return_items_for_bays( ["a9", "a6"] )
    assert_equal( expected, result )
  end

end