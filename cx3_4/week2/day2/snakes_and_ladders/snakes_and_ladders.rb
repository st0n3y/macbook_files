require_relative 'game.rb'
require_relative 'player.rb'
require_relative 'board.rb'
require_relative 'dice.rb'
require_relative 'viewer.rb'
require_relative 'turn_log.rb'

class SnakesAndLadders

  def initialize(dice)
    @dice - dice

    positions = {
      2 => 4,
      7 => -7
    }
    board = Board.new(9, positions)

    player1 = Player.new("Val")
    player2 = Player.new("Rick")

    players = [player1, player2]
    @game = Game.new(players, board)
  end

  def simulate()
    while(!@game.is_won?)
      @game.next_turn(@dice.roll)
    end

    viewer.replay(@game.log)
  end

  game = SnakesAndLadders.new(Dice.new)
  game.simulate(Viewer.new)

end