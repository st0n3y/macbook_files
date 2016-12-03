class MageKnight

  attr_accessor( :name, :hp, :sword_attack, :magic_attack )

  def initialize( name )
    @name = name
    @hp = 100
    @sword_attack = 20
    @magic_attack = 25
  end

  def take_damage( damage )
    return @hp -= damage
  end

  def attack( dragon, attack )
    dragon.take_damage( attack )
  end

end