def todays_weather(weather1, weather2)
  puts "Today's weather is #{weather1} with a chance of #{weather2}."
end

todays_weather("cloudy", "meatballs")


def weather()
  temperature = gets.chomp.to_i
  if temperature >= 30
    puts "Hot hot hot!"
  elsif temperature == 17..29
    puts "Nice and warm."
  else
    puts "Bleh."
  end
end

weather()