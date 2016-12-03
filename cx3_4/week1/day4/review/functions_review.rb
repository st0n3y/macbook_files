def my_name_and_favourite_numbers( name, numbers )
  for number in numbers
    puts "I like #{number}."
  end

  return name
end

puts my_name_and_favourite_numbers( "Keith", [ 23, 18, 89 ] )


def sort_numbers( numbers )
  
  map = []
  for number in numbers
    if number < 20 
      map << number
    end
  end

  return map
end

puts sort_numbers( [4, 10, 15, 18, 23, 31] )


def sort_numbers_dynamic( numbers, value )

  map = []
  for number in numbers
    if number > value
      map << number
    end
  end

  return map
end

input = gets.chomp.to_i

puts sort_numbers_dynamic( [ 4,10,13,15,23,31 ], input)