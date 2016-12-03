class Board

 attr_accessor :state

def initialize(size, positions)
 @state = Array.new(size, 0)

 for key in positions.keys
  @state[key] = positions[key]
 end
end

def win_tile
  return @state.length - 1
end



end
















# @tiles = [ 0, 0, 0, 0, 0, -3, 0, 0, 1, -3, 0, 0, 1, 0 ,0 ,0 ,0, -3, 0, 0, 0, 1, 0, -3, 0]