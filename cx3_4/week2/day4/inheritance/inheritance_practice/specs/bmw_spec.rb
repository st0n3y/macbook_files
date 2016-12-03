require('minitest/autorun')
require('minitest/rg')
require_relative('../bmw_subclass.rb')


class BMWTest < MiniTest::Test

  def setup()
    @bmw = BMW.new(4)
  end

  def test_BMW_can_drive()
    assert_equal("driving", @bmw.drive)
  end

end