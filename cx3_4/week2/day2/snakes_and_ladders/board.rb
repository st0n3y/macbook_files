class Board

  attr_accessor :state

  def initialize( size, positions )
    @state = Array.new( size, 0 )
    
    for key in positions.keys
      @state[key] = positions[key]
    end
  end
  
  def state
    return @state
  end

  def win_tile()
    return @state.length - 1
  end

end