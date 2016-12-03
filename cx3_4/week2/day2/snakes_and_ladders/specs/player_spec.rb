require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../player.rb' )

class TestPlayer < MiniTest::Test

  def setup
    @player = Player.new( "Val" )
  end

  def test_player_has_a_name()
    assert_equal( "Val", @player.name )
  end

  def test_player_starts_at_0()
    assert_equal( 0, @player.position )
  end

  def test_player_can_move()
    @player.move( 5 )
    test_result = @player.position
    expected_result = 5
    assert_equal( expected_result, test_result )
  end

end