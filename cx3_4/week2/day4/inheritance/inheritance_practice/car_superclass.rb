class Car

  attr_reader :num_of_wheels

  def initialize(num_of_wheels)
    @num_of_wheels = num_of_wheels
  end

  def drive()
    return "driving"
  end

  

end