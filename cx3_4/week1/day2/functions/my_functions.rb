def my_name()
  name = "David"
  return name
end

def not_my_name()
  name = "Not my name"
  return name
end

puts not_my_name()

#puts my_name()

def game_of_thrones_rocks?(name)
  if name == "Val"
    return false
  elsif name == "Aidan"
    return true
  else
    return "No idea"
  end
end

puts game_of_thrones_rocks?("Aidan")


def greet(first_name, last_name)
  puts "Hello, #{first_name} #{last_name}."
end

greet("John", "Smith")



def add(num_1, num_2)
  return num_1 + num_2
end















