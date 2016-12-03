class Dragon

  attr_accessor( :name, :hp, :flame_breath, :claw_attack  )

  def initialize( name )
    @name = name
    @hp = 100
    @flame_breath = 20
    @claw_attack
  end

  def take_damage( damage )
    return @hp -= damage
  end

  def attack( knight, attack )
    knight.take_damage( attack )
  end

end