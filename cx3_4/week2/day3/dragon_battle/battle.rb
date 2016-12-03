class Battle

  attr_accessor :combatants

  def initialize( combatants )
    @combatants = combatants
  end

  def start_game()
    type_of_attack = @combatants[0].flame_breath
    @combatants[0].attack( @combatants[1], type_of_attack )
  end

  

end