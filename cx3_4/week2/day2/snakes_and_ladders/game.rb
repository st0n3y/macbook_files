require_relative( './turn_log' )

class Game


  attr_reader :current_player, :winner, :log

  def initialize( players, board )
    @players = players
    @board = board
    @current_player = players[ 0 ]
    @winner = nil
    @log = []
  end

  def number_of_players()
    return @players.length
  end

  def update_current_player()
    @current_player = @players.rotate![ 0 ]
  end

  def next_turn( distance )
    return if (is_won?) 
    distance_to_end = @board.win_tile - @current_player.position
    movement = distance > distance_to_end ? distance_to_end : distance
    @current_player.move( movement )
    
    modifier = @board.state[ @current_player.position ]
    @current_player.move( modifier )

    # if @current_player.position == @board.win_tile
    #   return true
    # end

    log << TurnLog.new(player: @current_player, roll: distance, modifier: modifier )

    update_current_player
    return nil
  end

  def is_won?()
    for player in @players
      @winner = player if player.position == @board.win_tile
    end

      return @winner.nil? ? false : true
  end

end