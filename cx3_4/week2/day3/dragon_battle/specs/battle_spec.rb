require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../dragon.rb' )
require_relative( '../mage_knight.rb' )
require_relative( '../battle.rb' )

class TestBattle < MiniTest::Test

  def setup()
    @dragon = Dragon.new( "Abaddon" )
    @mage_knight = MageKnight.new( "Marneus" )    

    @battle = Battle.new( [ @dragon, @mage_knight ] )
  end

  def test_attack()
    @battle.start_game
    assert_equal( 80, @battle.combatants[1].hp )
  end

end