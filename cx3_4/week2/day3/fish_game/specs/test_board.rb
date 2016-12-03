require('minitest/autorun')
require('minitest/rg')
require_relative( '../player')
require_relative( '../board')
require_relative( '../game')

class TestBoard < MiniTest::Test

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


  @board = Board.new(25, positions)

end


def test_board_has_25_tiles
  assert_equal(25, @board.tiles.count)
end

def test_position_5_is_a_shark
  assert_equal(-3, @board.tiles[5])
end

def test_position_8_is_a_fish
  assert_equal(1, @board.tiles[8])
end

def test_win_tile
  assert_equal(24, @board.win_tile)
end


end