require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../dragon.rb' )

class TestDragon < MiniTest::Test

  def setup()
    @dragon = Dragon.new( "Abaddon" )
  end

  def test_dragon_has_a_name()
    assert_equal( "Abaddon", @dragon.name )
  end

  def test_dragon_starts_at_100_hp()
    assert_equal( 100, @dragon.hp )
  end

  def test_take_damage()
    hp_after_damage = @dragon.take_damage( 20 )
    assert_equal( 80, hp_after_damage )
  end

end