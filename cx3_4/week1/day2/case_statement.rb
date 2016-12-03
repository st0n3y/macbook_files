puts "What is your score?"
score = gets.chomp.to_i

result = case score
  when 10
    'genius'
  when 8..9
    'merit'
  when 5..7
    'pass'
  else
    'fail'
  end

  puts result