require('minitest/autorun')
require('minitest/rg')
require_relative( '../player')
require_relative( '../board')
require_relative( '../game')

class TestGame < MiniTest::Test

  def setup

    positions = {

     6 => -3,
     8 => 1,
     9 => -3,
     12 => 1,
     17 => -3,
     21 => 1,
     23 => -3,

    }

    board = Board.new(25, positions)

    @player_1 = Player.new("Sharky")
    @player_2 = Player.new("George")
 
    players = [@player_1, @player_2]

    @game = Game.new(players, board)

  end

  def test_game_starts_with_2_players()
    assert_equal(2, @game.number_of_players)
  end

  def test_game_current_player_starts_as_player_1()
    assert_equal(@player_1, @game.current_player)
  end

  def test_update_current_player()
    @game.update_current_player
    assert_equal(@player_2, @game.current_player)
  end

  def test_can_take_turn()
    @game.take_turn(5)
    assert_equal(@player_2, @game.current_player)
    assert_equal(5, @player_1.position)
  end

  def test_cannot_move_beyond_end()
    @game.take_turn(30)
    assert_equal(24, @player_1.position)
  end

  def test_health_check_on_shark()
    @game.health_check(5)
    assert_equal(7, @current_player.health)
  end

end