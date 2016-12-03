require('minitest/autorun')
require('minitest/rg')
require_relative('../robin_subclass.rb')

class RobinTest < MiniTest::Test

  def setup()
    @robin = Robin.new(3)
  end

  def test_robin_has_3_wheels()
    assert_equal(3, @robin.num_of_wheels)
  end


end