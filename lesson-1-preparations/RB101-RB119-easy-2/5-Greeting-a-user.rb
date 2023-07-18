def scream_greeting
  print "What is your name? "
  name = gets.chomp
  
  if name.include?('!') then puts "HELLO #{name.upcase.gsub('!','')}. WHY ARE WE SCREAMING?"
  else puts "Hello #{name}." end
end 

def scream_greeting_further_exploration
  print "What is your name? "
  name = gets
  name.chomp!
  
  if name.include?('!') then puts "HELLO #{name.upcase.chop!}. WHY ARE WE SCREAMING?"
  else puts "Hello #{name}." end
end

scream_greeting_further_exploration