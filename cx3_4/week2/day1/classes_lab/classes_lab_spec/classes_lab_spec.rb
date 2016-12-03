require('minitest/autorun')
require 'minitest/rg'
require_relative('../classes_lab.rb')

class TestClassesLab < MiniTest::Test

  def test_pick_up_passengers()
    serenity = SpaceShip.new( 8, 500, 5, 100, 100 )
    serenity.pick_up_passengers( 2 )
    assert_equal( 7, serenity.passengers )
  end

  def test_offload_passengers()
    serenity = SpaceShip.new( 8, 500, 5, 100, 100 )
    serenity.offload_passengers( 2 )
    assert_equal( 3, serenity.passengers )
  end

  def test_take_damage()
    serenity = SpaceShip.new( 8, 500, 5, 100, 100 )
    serenity.take_damage( "laser" )
    assert_equal( 95, serenity.hull_integ )
  end

  def test_load_cargo()
    serenity = SpaceShip.new( 8, 500, 5, 100, 100 )
    serenity.load_cargo( 35 )
    assert_equal( 65, serenity.cargo_cap )
  end

  def test_unload_cargo()
    serenity = SpaceShip.new( 8, 500, 5, 100, 65 )
    serenity.unload_cargo( 25 )
    assert_equal( 90, serenity.cargo_cap )
  end

end