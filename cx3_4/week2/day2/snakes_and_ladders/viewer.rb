require_relative 'game.rb'
require_relative 'player.rb'
require_relative 'board.rb'
require_relative 'dice.rb'
require_relative 'snakes_and_ladders.rb'
require_relative 'turn_log.rb'

class Viewer

  def replay(log)
    puts "#{item.player.name} rolled #{item.roll}."
    if(item.modifier != 0)
      puts "#{item.player.name} hit a #{item.modifier.type}! Moves #{item.modifier}."
    end
  end
  puts "The winner is #{item.player.name}!"

end