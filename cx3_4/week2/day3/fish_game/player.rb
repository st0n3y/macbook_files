class Player

  attr_accessor :name, :position, :health

  def initialize(name)
    @name = name
    @position = 0
    @health = 10
  end


 def move(distance)
  @position += distance
 end

 

end
