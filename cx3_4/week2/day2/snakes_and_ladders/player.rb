class Player

  attr_accessor( :name, :position )

  def initialize( name )
    @name = name
    @position = 0
  end

  def move( num_of_spaces )
    @position += num_of_spaces
  end

end