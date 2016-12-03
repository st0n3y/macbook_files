require_relative('bird.rb')

class Duck < Bird

  def initialize(num_of_legs)
    @attitude = "off the scale"
    super(num_of_legs)
  end

end