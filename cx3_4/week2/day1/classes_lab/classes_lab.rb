class SpaceShip

  attr_accessor :crew, :speed, :passengers, :hull_integ, :cargo_cap

  def initialize( crew, speed, passengers, hull_integ, cargo_cap )
    @crew = crew
    @speed = speed
    @passengers = passengers
    @hull_integ = hull_integ
    @cargo_cap = cargo_cap
  end

  def pick_up_passengers( passengers_on )
    @passengers += passengers_on
  end

  def offload_passengers( passengers_off )
    @passengers -= passengers_off
  end

  def take_damage( attack_type )
    @hull_integ -= 5 if attack_type == "laser"
    @hull_integ -= 15 if attack_type == "missile"
  end

  def load_cargo( cargo_on )
    @cargo_cap -= cargo_on
  end

  def unload_cargo( cargo_off )
    @cargo_cap += cargo_off
  end

end