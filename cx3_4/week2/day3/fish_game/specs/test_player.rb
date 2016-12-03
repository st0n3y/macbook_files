require('minitest/autorun')
require('minitest/rg')
require_relative( '../player')

class TestPlayer < MiniTest::Test

  def setup
    @player = Player.new("Finn")
  end

  def test_player_name
    assert_equal("Finn", @player.name)
  end
  def test_player_starts_at_0
    assert_equal(0, @player.position)
  end

  def test_player_can_move
    @player.move(6)
    assert_equal(6, @player.position)
  end

  def test_player_start_health
    assert_equal(10, @player.health)
  end
end