require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../game.rb' )
require_relative( '../player.rb' )
require_relative( '../board.rb' )

class TestGame < MiniTest::Test

  def setup
    positions = {
      2 => 4,
      7 => -7
    }
    board = Board.new( 9, positions )
  
    @player1 = Player.new( "Val" )
    @player2 = Player.new( "Keith" )
    @players = [ @player1, @player2 ]

    @game = Game.new( @players, board )

  end

  def test_game_starts_with_2_players()
    assert_equal( 2, @game.number_of_players )
  end

  def test_game_current_player_starts_as_player1()
    assert_equal( @player1, @game.current_player )
  end

  def test_can_update_current_player()
    @game.update_current_player
    assert_equal( @player2, @game.current_player )
  end

  def test_can_take_turn()
    @game.next_turn( 1 )
    assert_equal( @player2, @game.current_player )
    assert_equal( 1, @player1.position )
  end

  def test_cannot_move_beyond_end()
    @game.next_turn( 12 )
    assert_equal( 8, @player1.position )
  end

  def test_can_take_turn_with_ladder()
    @game.next_turn( 2 )
    assert_equal( 6, @player1.position )
  end

  def test_can_take_turn_with_snake()
    @game.next_turn( 7 )
    assert_equal( 0, @player1.position )
  end

  # def test_has_game_been_won()
  #   assert_equal( true, @game.next_turn( 8 ) )
  # end

  def test_game_is_won()
    @game.next_turn( 8 )
    assert_equal( true, @game.is_won? )
  end

  def test_no_next_turn_on_win()
    @game.next_turn( 8 )
    assert_equal( true, @game.is_won? )

    @game.next_turn( 2 )
    assert_equal( 0, @player2.position )
  end

  def test_adds_turn_to_log()
    @game.next_turn( 1 )
    assert_equal( 1, @game.log.length )
    assert_equal( "Val", @game.log[0].player.name )
    assert_equal( 1, @game.log[0].roll )
    assert_equal( 0, @game.log[0].modifier )
  end

end