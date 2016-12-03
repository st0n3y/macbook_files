i = 0
max_num = 5

while i < max_num do
  puts "All work and no play makes Jack a dull boy"
  i += 1
end

my_array = [1,4,3,28,76]

for num in my_array
  puts num
end

x = 0

until x == 10
  puts x += 1
end


my_number = 5
puts "What number am I thinking of?"
value = gets.to_i

until value == my_number
  print "Nope, try again:"
  value = gets.to_i
end

puts "Yes!"



loop do
  print "Type something: "
  line = gets.chomp
  break if line.downcase == 'q'
  puts "You typed: #{line}"
end