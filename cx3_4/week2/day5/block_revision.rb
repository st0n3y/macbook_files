# def block_func_1()
#   yield
# end

# block_func_1 { puts "Hello, world!" }


# def block_func_2( planet )
#   name = "Yoda"
#   age = 900
#   yield( name, age, planet )
# end

# block_func_2( "Dagobah" ) { |n, a, c| puts c }


# def calculator( a, b )
#   yield( a, b )
# end

# puts calculator( 2, 3 ) { |num_1, num_2| num_1 + num_2 }
# puts calculator( 2, 3 ) { |num_1, num_2| num_1 - num_2 }


board = [ [1,2,3], [4,5,6] ]

def calc_all( array )
  sum = 0
  for item in array
    total = yield( item )
    sum += total
  end
  return sum
end

puts calc_all( board ) { |i| i.inject(:+) }