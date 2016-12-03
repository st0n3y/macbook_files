class Mammal

  attr_reader :hair

  def initialize()
    @hair = true
  end

end

m = Mammal.new()
# m.hair = false


puts m.hair