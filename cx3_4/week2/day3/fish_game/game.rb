class Game

 attr_accessor :current_player, :winner, :log

 def initialize(players, board)
  @players = players
  @board = board
  @current_player = players[0]
  @winner = nil
  @log = []
 end

 def number_of_players()
   return @players.count
 end

 def update_current_player()
    @current_player = @players.rotate![0]
 end

 def take_turn( spaces_moved )
   return if (is_won?)
   
   distance_to_win_tile = @board.win_tile - @current_player.position
   movement = spaces_moved > distance_to_win_tile ? distance_to_win_tile : spaces_moved
   @current_player.move( movement )


   update_current_player

 end

 def is_won?
   for player in @players
     @winner = player if player.position >= @board.win_tile
   end
   return !@winner.nil? ? true : false
 end

 def health_check( position )
   @current_player.health += @state[position]
   
 end


end