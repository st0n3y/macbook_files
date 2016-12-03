# module Pokemon

#   class Array

#     def pokemon
#       return "Bulbasaur"
#     end

#     def capture( pokemon )
#       pokeball = []
#       pokeball.push( pokemon )
#     end

#     def []( index )
#       return "Pikachu"
#     end

#   end

# end

module CrazyMath

  PI = 100

  def return_pi()
    return PI
  end

end

class RickMath
  include CrazyMath
end

rick = RickMath.new()
puts rick.return_pi