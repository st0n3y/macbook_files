require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../mage_knight.rb' )

class TestMageKnight < MiniTest::Test

  def setup()
    @mage_knight = MageKnight.new( "Marneus")
  end

  def test_mageknight_has_a_name()
    assert_equal( "Marneus", @mage_knight.name )
  end

  def test_mageknight_starts_at_100_hp()
    assert_equal( 100, @mage_knight.hp )
  end

  def test_take_damage()
    hp_after_damage = @mage_knight.take_damage( 20 )
    assert_equal( 80, hp_after_damage )
  end

end