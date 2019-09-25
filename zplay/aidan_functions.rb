def duckify(duck_string)
  if duck_string.include? "s" 
    duck_string.gsub! /s/, "th"
  else
    puts "nothing to do here" 
  end

  puts "Your now daffy duckified string is: #{duck_string}" 
end

puts "Hello!"
loop do
  print "Please input text to be Daffy Duckified, or 'e' to exit: " 
  user_input = gets.chomp
  user_input.downcase!
  break if user_input == 'exit' || user_input == 'e'
  duckify user_input
end
puts "Goodbye!"